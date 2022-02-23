import 'package:flutter/material.dart';

// ignore: always_specify_types
class SlideIn extends PageRouteBuilder {
  final Widget page;
  SlideIn({required this.page})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> firstAnim,
              Animation<double> secAnim,
            ) {
              return page;
            },
            transitionDuration: const Duration(milliseconds: 300),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (BuildContext context,
                Animation<double> firstAnim,
                Animation<double> secAnim,
                Widget child) {
              Offset first = const Offset(1.0,0);
              Offset second = Offset.zero;
              Animatable<Offset> tween = Tween<Offset>(begin: first, end: second)
                  .chain(CurveTween(curve: Curves.easeInOut));
              Animation<Offset> offset = firstAnim.drive(tween);
              return SlideTransition(
                position: offset,
                child: child,
              );
            });
}
