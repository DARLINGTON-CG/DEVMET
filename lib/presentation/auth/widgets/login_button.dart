import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? func;

  const LoginButton({Key? key, required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
          padding:const EdgeInsets.all(20),
          margin: const EdgeInsets.all(15),
          width: 90,
          height: 90,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color:const Color(0xffe3f6fd), shape: BoxShape.circle),
          child: Text(
            "Start",
            style: GoogleFonts.alegreya(fontSize: 20, color: Colors.black),
          )),
    );
  }
}
