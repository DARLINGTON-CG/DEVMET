import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_bloc/app_bloc.dart';
import 'bloc/app_bloc/app_bloc_observer.dart';

import 'data_layer/repositories/auth_repository/auth_repository.dart';
import 'presentation/auth/pages/auth_page.dart';
import 'presentation/home/pages/homepage.dart';

//import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  await Firebase.initializeApp();
  final authRepository = AuthRepository();
  await authRepository.user.first;

  BlocOverrides.runZoned(
    () => runApp(App(authRepository: authRepository)),
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  final AuthRepository _authRepository;

  const App({Key? key, required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
          create: (_) => AppBloc(authenticationRepository: _authRepository),
          child: const AppView()),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _status = context.select((AppBloc bloc) => bloc.state.status);

    return MaterialApp(
        title: 'Meet',
        debugShowCheckedModeBanner: false,
        home:
            _status == AppStatus.authenticated ? HomePage() : const AuthPage());
  }
}
