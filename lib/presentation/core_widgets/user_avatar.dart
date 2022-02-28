import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100)),
      width: 100,
      height: 100,
      child: Center(
        child: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: Color(0xFF171531),
            image: DecorationImage(
                image: AssetImage("assets/images/user_avatar.png")),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
