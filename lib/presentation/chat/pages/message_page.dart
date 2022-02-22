import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessagingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
        
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2)
              ),
            ),
            SizedBox(width: 15,),
            Text("Raised By Wolves"),
          ],
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
    
      body: Center(
        child: Text(
          "Welcome to the message page",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
