import 'dart:io';

import 'package:devmet/presentation/anim/route_anim/slide_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../core_pages/edit_picture_page.dart';
import '../../core_widgets/user_avatar.dart';

class UserDataPage extends StatefulWidget {
  const UserDataPage({Key? key}) : super(key: key);

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  File? _wallpaper;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          key: const Key('user_data_page_floating_action_key'),
          onPressed: () {},
          child: const Icon(Icons.arrow_forward_rounded),
          backgroundColor: const Color(0xFF3212F1)),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: InkWell(
                onTap: () async {
                  final XFile? _imageFilePicked =
                      await _imagePicker.pickImage(source: ImageSource.gallery);
                  if (_imageFilePicked != null) {
                    setState(() {
                      _wallpaper = File(_imageFilePicked.path);
                    });
                    // Navigator.pop(context);
                    Future<void>.delayed(const Duration()).then((_) =>
                        Navigator.of(context).push(SlideUp(
                            page: EditPicturePage(picture: _wallpaper!))));
                  }
                },
                child:const UserAvatar()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            child: TextField(
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 17,
              ),
              maxLength: 30,
              decoration: InputDecoration(
                hintText: 'Name...',
                counterStyle: GoogleFonts.lato(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3212F1), width: 2.0),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                hintStyle: GoogleFonts.lato(
                  color: Colors.grey,
                  fontSize: 17,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
