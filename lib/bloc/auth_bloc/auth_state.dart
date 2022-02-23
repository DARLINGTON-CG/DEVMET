part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final FormzStatus status;
  final String? errorMessage;

  const AuthState({this.status = FormzStatus.pure, this.errorMessage});

  @override
  // ignore: always_specify_types
  List<Object?> get props => [status];

  AuthState copyWith({FormzStatus? status, String? errorMessage}) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }
}
