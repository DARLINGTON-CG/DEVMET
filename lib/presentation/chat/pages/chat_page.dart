import 'package:devmet/presentation/anim/route_anim/slide_in.dart';
import 'package:devmet/presentation/chat/pages/message_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../anim/route_anim/slide_up.dart';
import '../../profile/pages/profile_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        title:const Text('Chats'),
        elevation: 0.0,
        pinned: true,
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
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.search,
            ),
          )
        ],
      ),
      SliverAnimatedList(
        itemBuilder: (BuildContext context, int index, Animation<double> anim) {
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            title: Text(
              'Raised By Wolves',
              style: GoogleFonts.alegreya(
                  color: const Color(0xFFF1F1F1),
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'A desire after lottery!! If i would..',
              style: GoogleFonts.alegreya(color: const Color(0xFFF1F1F1),fontSize: 15),
            ),
            onTap: () {
              Navigator.of(context).push(SlideIn(page: MessagingPage()));
            },
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('16:51', style: GoogleFonts.alegreya(color: Colors.white,fontSize:15)),
                Container(
                  width: 21,
                  height: 21,
                  margin: const EdgeInsets.all(4),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffe3f6fd),
                  ),
                  child: Center(
                      child: Text('12',
                          style: GoogleFonts.alegreya(
                              color: Colors.black, fontSize: 11,))),
                )
              ],
            ),
          );
        },
        initialItemCount: 10,
      )
    ]);
  }
}
