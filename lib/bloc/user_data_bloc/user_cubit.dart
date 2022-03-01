import 'package:devmet/data_layer/models/user_model.dart';
import 'package:devmet/data_layer/repositories/user_repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'user_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserModel model;
  final UserRepository userRepository;
  UserDataCubit({required this.model, required this.userRepository})
      : super(UserDataState(model: model));

  Future<void> addDataToFirebase() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await userRepository.addUserPersonalData();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> getDataFromFirebase() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      UserModel model = await userRepository.getUserPersonalData();
      emit(state.copyWith(status: FormzStatus.submissionSuccess, model: model));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
