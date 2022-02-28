import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../anim/route_anim/slide_up.dart';
import '../../profile/pages/profile_page.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget> [
        SliverAppBar(
          title: const Text('All Activities'),
          elevation: 0.0,
          pinned: true,
          centerTitle: true,
          leading: Center(
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).push(SlideUp(page: const ProfilePage())),
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    shape: BoxShape.circle),
              ),
            ),
          ),
          actions:<Widget> [
            IconButton(
                onPressed: () =>
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      padding: const EdgeInsets.all(10),
                      width: 240,
                     
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                          const Icon(Icons.cancel_rounded, color: Colors.red),
                          const SizedBox(width: 13),
                          Text('No internet connection',
                              style: GoogleFonts.alegreya(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                        ],
                      ), //Container(child: Text("No internet connection\nPlease we will addres it,\n Dont fret")),
                      backgroundColor: Colors.black,
                      behavior: SnackBarBehavior.floating,
                    )),
                icon: Badge(
                  badgeContent: const Text(''),
                  badgeColor: const Color(0xffe3f6fd),
                  stackFit: StackFit.loose,
                  position: BadgePosition.topEnd(end: 0),
                  child: const FaIcon(
                    FontAwesomeIcons.bell,
                  ),
                ))
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 52,
            padding: const EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:<Widget> [
                Container(
                    height: 52,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFFFFB20F)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        const Icon(Icons.all_inclusive_rounded),
                        const SizedBox(width: 10),
                        Text('All Actvities',
                            style: GoogleFonts.alegreya(
                                color: Colors.black, fontSize: 16)),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.cancel_rounded,
                          size: 20,
                          color: Colors.black,
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
                      children:<Widget> [
                        const Icon(Icons.event),
                        const SizedBox(width: 10),
                        Text('Events',
                            style: GoogleFonts.alegreya(
                                color: Colors.black, fontSize: 16)),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.cancel_rounded,
                          size: 20,
                          color: Colors.black,
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
                      children: <Widget>[
                        const Icon(Icons.mic_rounded),
                        const SizedBox(width: 10),
                        Text('Podcasts',
                            style: GoogleFonts.alegreya(
                                color: Colors.black, fontSize: 16)),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.cancel_rounded,
                          size: 20,
                          color: Colors.black,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text('Events',
                    style: GoogleFonts.alegreya(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFFFFF))),
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ],
          ),
        )),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text('Podcasts',
              style: GoogleFonts.alegreya(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFFFFFF))),
        )),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: <Widget> [
                  Container(
                    width: 120,
                    height: 150,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.2)),
                  ),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                        Text(
                          'Arts and Humanities',
                          style: GoogleFonts.alegreya(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFFFFFF)),
                        ),
                        Text(
                          'Inspiration of young minds to become creative.',
                          style: GoogleFonts.alegreya(
                              fontSize: 16, color: const Color(0xABFFFFFF)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Icon(Icons.add_circle)
                      ]))
                ],
              ),
            );
          },
          childCount: 10,
        )),
      ],
    );
  }
}
