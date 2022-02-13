import 'package:devmet/bloc/auth_bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocProvider<AuthCubit>(
        create: (_) => AuthCubit(context.read<AuthRepository>()),
        child: Builder(builder: (context) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
           
             
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                     ),
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
