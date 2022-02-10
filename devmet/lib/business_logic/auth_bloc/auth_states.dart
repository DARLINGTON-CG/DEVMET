part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [status];

  AuthState copyWith({
    FormzStatus? status,
    String? errorMessage,
  }) {
    return AuthState(
     status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
