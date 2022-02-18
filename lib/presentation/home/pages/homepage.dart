import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../bloc/app_bloc/app_bloc.dart';
import '../../anim/route_anim/slide_up.dart';
import '../widgets/navigation_bar_item.dart';
import '../../profile/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("All Activities"),
        elevation: 0.0,
        centerTitle: true,
        leading: Center(
          child: GestureDetector(
            onTap: () =>
                Navigator.of(context).push(SlideUp(page: ProfilePage())),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2), shape: BoxShape.circle),
            ),
          ),
        ),
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
                ),
              ))
        ],
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (int selected) {
          setState(() {
            index = selected;
          });
        },
        destinations: [
          NavBarItem(
              label: "Home", iconName: Icons.grid_view, isSelected: index == 0),
          NavBarItem(
              label: "Chat",
              iconName: Icons.chat_bubble_rounded,
              isSelected: index == 1),
          FloatingActionButton.small(
              key: UniqueKey(),
              onPressed: () {},
              child: const Icon(
                Icons.add,
              ),
              backgroundColor: const Color(0xFF3212F1)),
          NavBarItem(
              label: "Communities",
              iconName: Icons.auto_graph_rounded,
              isSelected: index == 3),
          NavBarItem(
              label: "Payments",
              iconName: Icons.account_balance_wallet_rounded,
              isSelected: index == 4),
        ],
      ),
      body: CustomScrollView(
        slivers: [
        
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 52,
              padding: const EdgeInsets.all(5),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      height: 52,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFFFB20F)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.all_inclusive_rounded),
                          const SizedBox(width: 10),
                          Text("All Actvities",
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
                        children: [
                          const Icon(Icons.event),
                          const SizedBox(width: 10),
                          Text("Events",
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
                        children: [
                          const Icon(Icons.mic_rounded),
                          const SizedBox(width: 10),
                          Text("Podcasts",
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text("Events",
                      style: GoogleFonts.alegreya(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF))),
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
            child: Text("Podcasts",
                style: GoogleFonts.alegreya(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF))),
          )),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 150,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.2)),
                    ),
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(
                            "Arts and Humanities",
                            style: GoogleFonts.alegreya(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF)),
                          ),
                          Text(
                            "Inspiration of young minds to become creative.",
                            style: GoogleFonts.alegreya(
                                fontSize: 16, color: Color(0xABFFFFFF)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.add_circle)
                        ]))
                  ],
                ),
              );
            },
            childCount: 10,
          )),
        ],
      ),
    );
  }
}
