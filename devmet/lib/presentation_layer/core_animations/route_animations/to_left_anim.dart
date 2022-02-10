import 'package:flutter/material.dart';

class RightLeftSlide extends PageRouteBuilder {
  final Widget page;
  RightLeftSlide({required this.page})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              var first = const Offset(1, 0);
              var second = Offset.zero;
              var tween = Tween<Offset>(begin: first, end: second)
                  .chain(CurveTween(curve: Curves.easeInOutCubicEmphasized));
              var offsetAnim = animation.drive(tween);
              return SlideTransition(position: offsetAnim, child: child);
            });
}
