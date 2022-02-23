part of 'app_bloc.dart';

enum AppStatus {authenticated, unauthenticated}

class AppState extends Equatable {
  final AppStatus status;
  final UserModel user;

  const AppState._({
    required this.status,
    this.user = UserModel.empty
  });

  const AppState.authenticated(UserModel user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  @override
  // ignore: always_specify_types
  List<Object> get props => [status, user];

}