part of 'auth_repository.dart';


class LoginWithGoogleError implements Exception {
  final String message;
  const LoginWithGoogleError([this.message = 'An error occurred']);

  factory LoginWithGoogleError.fromCode(String errorCode) {
    switch (errorCode) {
      case 'account-exists-with-different-credential':
        return const LoginWithGoogleError(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LoginWithGoogleError(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LoginWithGoogleError(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LoginWithGoogleError(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LoginWithGoogleError(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LoginWithGoogleError(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LoginWithGoogleError(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LoginWithGoogleError(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LoginWithGoogleError();
    }
  }
}

class AccountDeletionError implements Exception {}

class LogOutError implements Exception {}
