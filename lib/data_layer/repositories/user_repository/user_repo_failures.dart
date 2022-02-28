part of 'user_repository.dart';

class UserRepoFailures implements Exception {
  final String message;
  const UserRepoFailures([this.message = 'An error occurred']);

  factory UserRepoFailures.fromCode(String errorCode) {
    switch (errorCode) {
      case 'aborted':
        return const UserRepoFailures('Aborted');
      case 'already-exists':
        return const UserRepoFailures('Aborted');
      case 'cancelled':
        return const UserRepoFailures('Cancelled');
      case 'data-loss':
        return const UserRepoFailures('Data Lost');
      case 'failed-precondition':
        return const UserRepoFailures('Failed Precondition');
      case 'invalid-argument':
        return const UserRepoFailures('Invalid argument');
      case 'not-found':
        return const UserRepoFailures('Requested document not found');
      case 'out-of-range':
        return const UserRepoFailures('User quota exhausted');
      case 'unauthenticated':
        return const UserRepoFailures('User is not authenticated');
      case 'unavailable':
        return const UserRepoFailures('This service is currently on available');
      default:
        return const UserRepoFailures('An unknown error occured');
    }
  }
}
