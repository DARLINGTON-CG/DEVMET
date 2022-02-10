import 'package:devmet/business_logic/auth_bloc/auth_cubit.dart';
import 'package:devmet/business_logic/connectivity_bloc/connectivity_cubit.dart';
import 'package:devmet/data_layer/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../widgets/sign_in_button.dart';
import '../../core_widgets/dialogs/notification_dialog.dart';
import 'package:formz/formz.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: AuthPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "MEET",
          style:
              GoogleFonts.lobster(color: const Color(0xFF0E1B19), fontSize: 27),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => AuthCubit(context.read<AuthRepository>())),
          BlocProvider(
              create: (_) => InternetCubit(
                  internetConnection: InternetConnectionChecker()))
        ],
        child: Builder(builder: (context) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                notificationDialog(
                    context: context,
                    notificationMessage:
                        state.errorMessage ?? 'Authentication Failure',
                    icon: const Icon(Icons.cancel, color: Colors.red));
              } 
             
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/auth_image.png")))),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 2, bottom: 30),
                    child: Text(
                        "Connect with your soulmate and live happily ever after, just like in the fairytales.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lobster(
                            color: const Color(0xFF0E1B19),
                            fontSize: 18,
                            letterSpacing: 1)),
                  ),
                  Builder(builder: (context) {
                    return LoginButton(func: () {
                      context.read<AuthCubit>().logInWithGoogle();
                    });
                  })
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
