import 'package:flutter/material.dart';

class SlideUp extends PageRouteBuilder {
  final Widget page;
  SlideUp({required this.page})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> firstAnim,
              Animation<double> secAnim,
            ) {
              return page;
            },
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder: (BuildContext context,
                Animation<double> firstAnim,
                Animation<double> secAnim,
                Widget child) {
              Offset first = const Offset(0, 1.0);
              Offset second = Offset.zero;
              var tween = Tween(begin: first, end: second)
                  .chain(CurveTween(curve: Curves.easeInOut));
              var offset = firstAnim.drive(tween);
              return SlideTransition(
                position: offset,
                child: child,
              );
            });
}
