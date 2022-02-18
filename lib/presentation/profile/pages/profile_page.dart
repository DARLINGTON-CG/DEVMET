import 'package:badges/badges.dart';
import 'package:devmet/presentation/anim/route_anim/slide_up.dart';
import 'package:devmet/presentation/profile/pages/account_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF131112),
            title: const Text("Profile"),
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
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            pinned: true,
            actions: [
              IconButton(
                  onPressed: () {},
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
              height: 200,
              margin: const EdgeInsets.only(bottom: 20),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  Text(
                    "Donat Twerski",
                    style: GoogleFonts.alegreya(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                ],
              )),
            ),
          ),
          
          SliverFillRemaining(
            child: Column(children: [
              ListTile(
                  leading: Container(
                    width: 55,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF119DA4)),
                    child: Center(
                        child: FaIcon(FontAwesomeIcons.database,
                            color: Colors.black)),
                  ),
                  title: Text(
                    "Data",
                    style: GoogleFonts.alegreya(
                      fontSize: 18,
                      color: Color(0xFFF1F1F1),
                    ),
                  ),
                  subtitle: Text("Personal user data",
                      style: GoogleFonts.alegreya(
                          fontSize: 17, color: Colors.grey))),
              ListTile(
                  leading: Container(
                    width: 55,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFFFC857)),
                    child:
                        Center(child: FaIcon(Icons.face, color: Colors.black)),
                  ),
                  title: Text(
                    "Friends",
                    style: GoogleFonts.alegreya(
                      fontSize: 18,
                      color: Color(0xFFF1F1F1),
                    ),
                  ),
                  subtitle: Text("Friendly system users",
                      style: GoogleFonts.alegreya(
                          fontSize: 17, color: Colors.grey))),
              ListTile(
                  leading: Container(
                    width: 55,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF98F5E1)),
                    child: Center(
                        child: FaIcon(FontAwesomeIcons.facebookMessenger,
                            color: Colors.black)),
                  ),
                  title: Text(
                    "Chats",
                    style: GoogleFonts.alegreya(
                      fontSize: 18,
                      color: Color(0xFFF1F1F1),
                    ),
                  ),
                  subtitle: Text("Friendly system users",
                      style: GoogleFonts.alegreya(
                          fontSize: 17, color: Colors.grey))),
              ListTile(
                  leading: Container(
                    width: 55,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF89FC00)),
                    child: Center(
                        child: FaIcon(FontAwesomeIcons.wrench,
                            color: Colors.black)),
                  ),
                  onTap: () => Navigator.of(context).push(SlideUp(page: AccountSettingsPage())),
                  title: Text(
                    "Account Settings",
                    style: GoogleFonts.alegreya(
                      fontSize: 18,
                      color: Color(0xFFF1F1F1),
                    ),
                  ),
                  subtitle: Text("System updates and alerts",
                      style: GoogleFonts.alegreya(
                          fontSize: 17, color: Colors.grey))),
            ]),
          )
        ],
      ),
    );
  }
}
