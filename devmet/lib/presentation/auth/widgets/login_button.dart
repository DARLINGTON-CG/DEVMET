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
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xffF08700)),
        child: Center(
          child: Stack(
            children: [
             
                    Positioned(
                      right: 50,
                      top: 4,
                      child: Text("CONTINUE",
                          style: GoogleFonts.lato(
                              fontSize: 16, color: const Color(0xFFFFFFFF))),
                    ),
                
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black.withOpacity(0.2),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
