import 'package:devmet/bloc/auth_bloc/auth_cubit.dart';
import 'package:devmet/bloc/user_data_bloc/user_cubit.dart';
import 'package:devmet/data_layer/models/user_model.dart';
import 'package:devmet/data_layer/repositories/user_repository/user_repository.dart';
import 'package:devmet/presentation/anim/route_anim/slide_in.dart';
import 'package:devmet/presentation/home/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data_layer/repositories/auth_repository/auth_repository.dart';
import '../widgets/login_button.dart';
import 'user_data_page.dart';

class AuthPage extends StatelessWidget {
  final UserModel userModel;
  const AuthPage({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiBlocProvider(
          // ignore: always_specify_types
          providers: [
            BlocProvider<AuthCubit>(
              create: (BuildContext context) =>
                  AuthCubit(context.read<AuthRepository>()),
            ),
            BlocProvider<UserDataCubit>(
              create: (BuildContext context) => UserDataCubit(
                  userRepository: context.read<UserRepository>(),
                  model: userModel),
            ),
          ],
          child: Builder(builder: (BuildContext context) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (BuildContext context, AuthState state) {
                      if (state.status.isSubmissionFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          padding: const EdgeInsets.all(10),
                          width: state.errorMessage.toString().length > 21
                              ? 280
                              : 240,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(Icons.cancel_rounded,
                                  color: Colors.red),
                              const SizedBox(width: 13),
                              Text(state.errorMessage.toString(),
                                  style: GoogleFonts.alegreya(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          backgroundColor: Colors.black,
                          behavior: SnackBarBehavior.floating,
                        ));
                      } else if (state.status.isSubmissionSuccess) {
                        BlocProvider.of<UserDataCubit>(context)
                            .getDataFromFirebase()
                            .whenComplete(() {
                          bool emptyState =
                              BlocProvider.of<UserDataCubit>(context)
                                  .state
                                  .model
                                  .isEmpty;
                          if (emptyState) {
                            Navigator.of(context)
                                .pushReplacement(SlideIn(page: const UserDataPage()));
                          } else {
                            Navigator.of(context).pushReplacement(
                                SlideIn(page: const HomePage()));
                          }
                        });
                      }
                    },
                    builder: (BuildContext context, AuthState state) {
                      return Align(
                        alignment: Alignment.bottomRight,
                        child: LoginButton(
                            func: () {
                              context.read<AuthCubit>().logInWithGoogle();
                            },
                            isSubmissionProgressing:
                                state.status.isSubmissionInProgress ||
                                    BlocProvider.of<UserDataCubit>(context)
                                        .state
                                        .status
                                        .isSubmissionInProgress),
                      );
                    },
                  )
                ],
              ),
            );
          }),
        ));
  }
}
