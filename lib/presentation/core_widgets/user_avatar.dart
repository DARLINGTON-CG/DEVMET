import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import '../../constants/enums.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final File? file;
  final String? url;
  final UserAvatarType type;

  const UserAvatar({Key? key, this.file, this.url, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          shape: BoxShape.circle),
      width: 80,
      height: 80,
      child: Center(
        child: Container(
          width: 70,
          height: 70,
          child: type == UserAvatarType.non
              ? const Center(
                  child: Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                ))
              : Container(),
          decoration: type == UserAvatarType.non
              ? BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(100),
                )
              : BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(100),

                  image: type == UserAvatarType.file
                      ? DecorationImage(image: FileImage(file!),fit: BoxFit.cover)
                      : DecorationImage(
                          image: CachedNetworkImageProvider(url!))),
        ),
      ),
    );
  }
}
