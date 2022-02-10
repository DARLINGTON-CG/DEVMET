import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
    primarySwatch: Colors.yellow,
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    backgroundColor: Colors.white,
    dividerColor: Colors.blue,
    canvasColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.yellow,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
        bodyText1: GoogleFonts.poppins(
          color: const Color(0xFF342E1B),
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: GoogleFonts.poppins(
          color: const Color(0xFF342E1B),
          fontSize: 20,
        ),
        headline1: GoogleFonts.poppins(
          color: const Color(0xFF342E1B),
          fontSize: 35,
        ),
        headline2: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 25,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.amber,
      selectedIconTheme: IconThemeData(color: Colors.black),
      elevation: 0.0,
      unselectedIconTheme: IconThemeData(color: Colors.black),
    ));
