import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showCustomDialogBox( BuildContext context,String header,String message) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.grey.withOpacity(0.1),
      transitionBuilder: (BuildContext context, Animation<double> anim1, Animation<double> anim2, Widget child) {
        final double curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: anim1.value,
            child: AlertDialog(
              backgroundColor: Colors.black.withOpacity(0.3),
              elevation:0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              content: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding:const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Text(header,
                            style: GoogleFonts.alegreya(
                                fontSize: 20,
                              
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center
                                ),
                        Text(message,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alegreya(
                                fontSize: 16, color: Colors.white)),

                      ])),
            ),
          ),
        );
      },
      transitionDuration:const Duration(milliseconds: 900),
      pageBuilder: (BuildContext context, Animation<double> anim1, Animation<double> anim2) => Container());
}
