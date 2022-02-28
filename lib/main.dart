import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devmet/data_layer/models/user_model.dart';
import 'package:devmet/data_layer/repositories/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  final AuthRepository authRepository = AuthRepository();
  final UserModel user = await authRepository.user.first;
  final UserRepository userRepository =
      UserRepository(firestore: FirebaseFirestore.instance, user: user);

  await Hive.initFlutter();
  await Hive.openBox('personalData');

  BlocOverrides.runZoned(
    () => runApp(App(
      authRepository: authRepository,
      userRepository: userRepository,
    )),
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  const App(
      {Key? key,
      required AuthRepository authRepository,
      required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>.value(
      value: _authRepository,
      child: RepositoryProvider<UserRepository>.value(
        value: _userRepository,
        child: BlocProvider<AppBloc>(
            create: (_) => AppBloc(authenticationRepository: _authRepository),
            child: const AppView()),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final AppStatus _status =
    //     context.select((AppBloc bloc) => bloc.state.status);
    final bool? dataBox = Hive.box('personalData').get('approved') ?? false;
    final Widget initialPage = AuthPage();
        // dataBox == false 
        //     ? const AuthPage()
        //     : const HomePage();
   
    return MaterialApp(
        title: 'Meet',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: const Color(0xFF131112),
              actionsIconTheme:
                  const IconThemeData(color: Color(0xFFf1f1f1), size: 22),
              titleTextStyle: GoogleFonts.alegreya(
                  fontSize: 20, fontWeight: FontWeight.bold)),
          scaffoldBackgroundColor: const Color(0xFF131112),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          navigationBarTheme: const NavigationBarThemeData(
              backgroundColor: Color(0xFF131112),
              indicatorColor: Colors.transparent,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              height: 60),
          splashColor: Colors.transparent,
          textTheme: TextTheme(
            bodyText1: GoogleFonts.lato(fontSize: 19),
            bodyText2: GoogleFonts.lato(fontSize: 18),
          ),
        ),
        home: initialPage);
  }
}
