import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/models/user_model.dart';
import '../../data_layer/repositories/auth_repository/auth_repository.dart';

part 'app_states.dart';
part 'app_events.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(authenticationRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppAccountDeletionRequested>(_onDeletionRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (UserModel user) => add(AppUserChanged(user)),
    );
  }

  final AuthRepository _authenticationRepository;
  late final StreamSubscription<UserModel> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated());
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  void _onDeletionRequested(
      AppAccountDeletionRequested event, Emitter<AppState> emit) {
    _authenticationRepository.deleteUserAccount();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
