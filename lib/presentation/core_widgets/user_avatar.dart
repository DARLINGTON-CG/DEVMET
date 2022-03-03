import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100)),
      width: 100,
      height: 100,
      child: Center(
        child: Container(
          width: 90,
          height: 90,
          child: Center(child: Text('TAP',style:GoogleFonts.lato(fontWeight: FontWeight.bold,color:Colors.white))),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
            // image: DecorationImage(
            //     image: AssetImage("assets/images/user_avatar.png")),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
