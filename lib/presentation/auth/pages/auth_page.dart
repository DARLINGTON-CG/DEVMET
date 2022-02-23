import 'package:devmet/bloc/auth_bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data_layer/repositories/auth_repository/auth_repository.dart';
import '../widgets/login_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider<AuthCubit>(
        create: (_) => AuthCubit(context.read<AuthRepository>()),
        child: Builder(builder: (BuildContext context) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (BuildContext context, AuthState state) {
              if (state.status.isSubmissionFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage.toString())));
              }
            },
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 40, bottom: 30),
                    child: Text('Learn to Code,\nWith other people.',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.alegreya(
                          color: const Color(0xFFF1F1F1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image:
                            AssetImage('assets/images/login_illustration.png'),
                      )),
                    ),
                  ),
                  Builder(builder: (BuildContext context) {
                    return Align(
                      alignment: Alignment.bottomRight,
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
