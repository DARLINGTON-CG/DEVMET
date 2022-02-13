import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/app_bloc/app_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static Page page() => MaterialPage<void>(child: HomePage());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Michigan',
              style: GoogleFonts.lobster(
                  color: const Color(0xFF424B54), fontSize: 20),
            ),
            IconButton(
                onPressed: () {},
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                disabledColor: Colors.grey,
                icon: const Icon(
                  Icons.expand_more_rounded,
                  color: Color(0xFF0D5D56),
                ))
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.grid_view_rounded,
              color: Colors.black,
            )),
        actions: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_rounded,
                  color: Colors.black,
                ),
                onPressed: () =>
                    context.read<AppBloc>().add(AppLogoutRequested()),
              ),
              Positioned(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      resizeToAvoidBottomInset: false,
      body: const Center(child: Text("Welcome to the HOmePage")),
    );
  }
}
