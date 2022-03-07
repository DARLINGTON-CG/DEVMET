import 'dart:io';

import 'package:devmet/constants/enums.dart';
import 'package:devmet/data_layer/models/user_model.dart';
import 'package:devmet/presentation/anim/route_anim/slide_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../bloc/user_data_bloc/user_cubit.dart';
import '../../../data_layer/repositories/user_repository/user_repository.dart';
import '../../core_pages/edit_picture_page.dart';
import '../../core_widgets/user_avatar.dart';

class UserDataPage extends StatefulWidget {
  final UserModel model;

  const UserDataPage({Key? key, required this.model}) : super(key: key);

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  File? _wallpaper;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserDataCubit>.value(
      value: UserDataCubit(
          userRepository: context.read<UserRepository>(), model: widget.model),
      //create: (BuildContext context) => UserDataCubit(model:widget.model , userRepository: context.read<UserRepository>() ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            key: const Key('user_data_page_floating_action_key'),
            onPressed: () {},
            child: const Icon(Icons.arrow_forward_rounded),
            backgroundColor: const Color(0xFF3212F1)),
        appBar: AppBar(
          title: Text('Personal Information',
              style: GoogleFonts.lato(fontSize: 18)),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Enter your name and add a profile picture',
                textAlign: TextAlign.start,
                style: GoogleFonts.lato(fontSize: 16, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: <
                      Widget>[
                InkWell(
                    onTap: () async {
                      final XFile? _imageFilePicked = await _imagePicker
                          .pickImage(source: ImageSource.gallery);
                      final File? _converted = File((_imageFilePicked!).path);
                      Future<void>.delayed(const Duration()).then((_) =>
                          Navigator.of(context)
                              .push(SlideUp(
                                  page: EditPicturePage(picture: _converted)))
                              // ignore: always_specify_types
                              .then((value) {
                            setState(() {
                              _wallpaper = value;
                            });
                          }));
                    },
                    child: UserAvatar(
                      type: _wallpaper == null
                          ? UserAvatarType.non
                          : UserAvatarType.file,
                      file: _wallpaper,
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(children: <Widget>[
                      TextField(
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        maxLength: 25,
                        decoration: InputDecoration(
                          hintText: 'First Name (Required)',
                          counterText: '',
                          isCollapsed: true,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white)),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                          hintStyle: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        maxLength: 25,
                        decoration: InputDecoration(
                          hintText: 'Last Name (Optional)',
                          counterText: '',
                          isCollapsed: true,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white)),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                          hintStyle: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ]),
                  ),
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
