part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {}

class AppAccountDeletionRequested extends AppEvent {}

class AppUserChanged extends AppEvent
{
  @visibleForTesting
  const AppUserChanged(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}
