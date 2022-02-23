import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagingPage extends StatelessWidget {
  const MessagingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text('Raised By Wolves'),
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
      bottomSheet: BottomSheet(
          onClosing: () {},
          enableDrag: false,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20 * 0.75,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          style: GoogleFonts.alegreya(
                              color: Colors.white, fontSize: 19),
                          textAlignVertical: TextAlignVertical.bottom,
                          minLines: 1,
                          maxLines: 5,
                          decoration: InputDecoration(
                              hintText: 'Type message',
                              contentPadding: const EdgeInsets.only(bottom: 0),
                              isDense: true,
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.alegreya(
                                  color: Colors.grey, fontSize: 18)),
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      const Icon(
                        Icons.attach_file,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          'Welcome to the message page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
