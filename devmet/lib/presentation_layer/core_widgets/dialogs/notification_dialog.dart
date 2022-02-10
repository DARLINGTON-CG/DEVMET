import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void notificationDialog(
    {required BuildContext context,
    required String notificationMessage,
    required Icon icon}) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.grey.withOpacity(0.1),
      transitionBuilder: (context, anim1, anim2, child) {
        final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 100, 0.0),
          child: AlertDialog(
            alignment: Alignment.topCenter,
            backgroundColor: Colors.white.withOpacity(0.0),
            elevation: 0.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      icon,
                      const SizedBox(
                        width: 10,
                      ),
                      Text(notificationMessage,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lobster(
                              fontSize: 16, color: Colors.white))
                    ])),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (BuildContext context, anim1, anim2) => Container());

}
