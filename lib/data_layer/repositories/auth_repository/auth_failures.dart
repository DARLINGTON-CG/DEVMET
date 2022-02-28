part of 'auth_repository.dart';


class LoginWithGoogleError implements Exception {
  final String message;
  const LoginWithGoogleError([this.message = 'An error occurred']);

  factory LoginWithGoogleError.fromCode(String errorCode) {
    switch (errorCode) {
      case 'account-exists-with-different-credential':
        return const LoginWithGoogleError(
          'Exists with different credential.',
        );
      case 'invalid-credential':
        return const LoginWithGoogleError(
          'Invalid credential.',
        );
      case 'operation-not-allowed':
        return const LoginWithGoogleError(
          'Operation is not allowed.',
        );
      case 'user-disabled':
        return const LoginWithGoogleError(
         'Account Disabled.',
        );
      case 'user-not-found':
        return const LoginWithGoogleError(
          'Email is not found.',
        );
      case 'wrong-password':
        return const LoginWithGoogleError(
          'Incorrect password.',
        );
      case 'invalid-verification-code':
        return const LoginWithGoogleError(
          'Invalid verification code',
        );
      case 'invalid-verification-id':
        return const LoginWithGoogleError(
          'Credential Id invalid',
        );
      default:
        return const LoginWithGoogleError();
    }
  }
}

class AccountDeletionError implements Exception {}

class LogOutError implements Exception {}
