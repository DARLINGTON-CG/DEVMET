part of 'user_cubit.dart';

class UserDataState extends Equatable {
  final FormzStatus status;
  final UserModel model;
  final File? imageFile;
  const UserDataState(
      {required this.model, this.status = FormzStatus.pure, this.imageFile});

  UserDataState copyWith(
      {FormzStatus? status, UserModel? model, File? imageFile}) {
    return UserDataState(
        status: status ?? this.status,
        model: model ?? this.model,
        imageFile: imageFile ?? this.imageFile);
  }

  @override
  // ignore: always_specify_types
  List<Object?> get props => [status, model, imageFile];
}

