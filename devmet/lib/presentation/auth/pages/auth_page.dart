import 'package:devmet/bloc/auth_bloc/auth_cubit.dart';
import 'package:devmet/presentation/home/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data_layer/repositories/auth_repository/auth_repository.dart';
import '../widgets/login_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: AuthPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text(
      //     "MEET",
      //     style:
      //         GoogleFonts.lobster(color: const Color(0xFF0E1B19), fontSize: 27),
      //   ),
      //   centerTitle: true,
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      // ),
      backgroundColor: const Color(0xFF131112),
      body: BlocProvider<AuthCubit>(
        create: (_) => AuthCubit(context.read<AuthRepository>()),
        child: Builder(builder: (context) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage.toString())));
              }
            },
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    margin: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/login_illustration.png"),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 2, bottom: 30),
                    child: Text(
                        "The best place to share great ideas and make friends. Begin your journey by clicking continue.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: const Color(0xFFF1F1F1),
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        )),
                  ),
                  Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: LoginButton(func: () {
                        context.read<AuthCubit>().logInWithGoogle();
                      }),
                    );
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
