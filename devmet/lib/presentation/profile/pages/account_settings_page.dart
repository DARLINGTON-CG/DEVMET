import 'package:badges/badges.dart';
import 'package:devmet/presentation/anim/route_anim/slide_up.dart';
import 'package:devmet/presentation/auth/pages/auth_page.dart';
import 'package:devmet/presentation/core_widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/app_bloc/app_bloc.dart';
import '../../../bloc/auth_bloc/auth_cubit.dart';
import '../../../data_layer/repositories/auth_repository/auth_repository.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF131112),
            title: const Text("Account Settings"),
            centerTitle: true,
            leading: Center(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 30,
                  height: 30,
                  child: const Center(
                      child: FaIcon(
                    FontAwesomeIcons.angleLeft,
                    color: Color(0xFFF1F1F1),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            pinned: true,
          ),
          BlocProvider<AuthCubit>(
        create: (_) => AuthCubit(context.read<AuthRepository>()),
        child: Builder(builder: (context) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage.toString())));
              }
            },
            
          child:
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ListTile(
                  onTap: () {
                    context.read<AuthCubit>().deleteAccount();
                  },
                  leading: Container(
                    width: 55,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red),
                    child: Center(
                        child: Icon(Icons.delete_forever, color: Colors.black)),
                  ),
                  title: Text(
                    "Delete Account",
                    style: GoogleFonts.alegreya(
                      fontSize: 18,
                      color: Color(0xFFF1F1F1),
                    ),
                  ),
                  subtitle: Text("All user data will be erased",
                      style: GoogleFonts.alegreya(
                          fontSize: 17, color: Colors.grey)));
            }, childCount: 1),
          ));}))
        ],
      ),
    );
  }
}
