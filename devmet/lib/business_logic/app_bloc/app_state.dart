part of "app_bloc.dart";

enum AppStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  final AppStatus status;
  final LocalUser user;

  const AppState._({
    required this.status,
    this.user = LocalUser.empty
  });

  const AppState.authenticated(LocalUser user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];

}