import 'package:devmet/presentation/anim/route_anim/slide_in.dart';
import 'package:devmet/presentation/anim/widget_anim/slide_fade_anim.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core_widgets/user_avatar.dart';
import '../../home/pages/homepage.dart';

class UserDataPage extends StatefulWidget {
  const UserDataPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserDataPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerAnim;
  late Animation<double> _headerTextAnimation;
  late Animation<double> _imageAvatarAnim;
  late Animation<double> _nameAnim;
  late Animation<double> _welcomeTextAnim;
  late Animation<double> _startButtonAnim;

  @override
  void initState() {
    super.initState();
    _controllerAnim = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));

    Tween<double> fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);

    _headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _controllerAnim,
      curve: const Interval(
        0.0,
        0.5,
        curve: Curves.easeInOut,
      ),
    ));
    _imageAvatarAnim = fadeSlideTween.animate(CurvedAnimation(
      parent: _controllerAnim,
      curve: const Interval(
        0.0,
        0.5,
        curve: Curves.easeInOut,
      ),
    ));

    _nameAnim = fadeSlideTween.animate(CurvedAnimation(
      parent: _controllerAnim,
      curve: const Interval(
        0.0,
        0.6,
        curve: Curves.easeInOut,
      ),
    ));

    _welcomeTextAnim = fadeSlideTween.animate(CurvedAnimation(
      parent: _controllerAnim,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    _startButtonAnim = fadeSlideTween.animate(CurvedAnimation(
      parent: _controllerAnim,
      curve: const Interval(
        0.8,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    _controllerAnim.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeSlideTransition(
              animation: _headerTextAnimation,
              additionalOffset: 0,
              child: Text('Welcome',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 254, 254))),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeSlideTransition(
                additionalOffset: 0.0,
                animation: _imageAvatarAnim,
                child: const UserAvatar()),
            FadeSlideTransition(
              animation: _nameAnim,
              additionalOffset: 0.0,
              child: Text('Master Zero',
                  style: GoogleFonts.lato(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFFFFFF))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: FadeSlideTransition(
                animation: _welcomeTextAnim,
                additionalOffset: 0.0,
                child: Text(
                    'A constructive and inclusive social network for all emerging and veteran software developers and hobyists.\nMove with amazing people.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 17,
                        color: const Color.fromARGB(255, 255, 254, 254))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Hive.box('personalData').put('approved', true);
                Navigator.of(context).push(SlideIn(page: const HomePage()));
              },
              child: FadeSlideTransition(
                animation: _startButtonAnim,
                additionalOffset: 0.0,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(40),
                    width: 90,
                    height: 90,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color(0xffe3f6fd), shape: BoxShape.circle),
                    child: Text('Start',
                        style: GoogleFonts.lato(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
