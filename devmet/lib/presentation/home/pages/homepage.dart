import 'package:devmet/presentation/anim/route_anim/slide_up.dart';
import 'package:devmet/presentation/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/app_bloc/app_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static Page page() => MaterialPage<void>(child: HomePage());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF131112),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF131112),
            centerTitle: true,
            title:
                Text("All Activities", style: GoogleFonts.lato(fontSize: 18)),
            leading: Center(
              child: GestureDetector(
                onTap: () =>
                    Navigator.of(context).push(SlideUp(page: ProfilePage())),
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                      color: Color(0xFFf1f1f1), shape: BoxShape.circle),
                ),
              ),
            ),
            pinned: true,
            actions: [
              IconButton(
                  onPressed: () =>
                      context.read<AppBloc>().add(AppLogoutRequested()),
                  icon: Badge(
                    badgeContent: const Text(''),
                    badgeColor: const Color(0xffe3f6fd),
                    stackFit: StackFit.loose,
                    position: BadgePosition.topEnd(end: 0),
                    child: const FaIcon(
                      FontAwesomeIcons.bell,
                      size: 22,
                      color: Color(0xFFf1f1f1),
                    ),
                  ))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: const EdgeInsets.all(5),
              // color:Colors.red,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFFFB20F)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(FontAwesomeIcons.codeBranch),
                          const SizedBox(width: 10),
                          Text("All Actvities", style: GoogleFonts.lato()),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.cancel_rounded,
                            size: 20,
                          )
                        ],
                      )),
                  const SizedBox(width: 10),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFF8CFFDA)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.event),
                          const SizedBox(width: 10),
                          Text("Events", style: GoogleFonts.lato()),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.cancel_rounded,
                            size: 20,
                          )
                        ],
                      )),
                  const SizedBox(width: 10),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFE4FDE1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.mic_rounded),
                          const SizedBox(width: 10),
                          Text("Podcasts", style: GoogleFonts.lato()),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.cancel_rounded,
                            size: 20,
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
       
        ],
      ),
    );
  }
}
