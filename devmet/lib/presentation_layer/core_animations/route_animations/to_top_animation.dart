import 'package:flutter/material.dart';

class SlideUp extends PageRouteBuilder {
  final Widget page;
  SlideUp({required this.page})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              var first = const Offset(0.0, 1.0);
              var second = Offset.zero;
              var tween = Tween<Offset>(begin: first, end: second)
                  .chain(CurveTween(curve: Curves.easeInOutCubicEmphasized));
              var offsetAnim = animation.drive(tween);
              return SlideTransition(position: offsetAnim, child: child);
            });
}
