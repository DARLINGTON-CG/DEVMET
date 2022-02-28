import 'package:flutter/material.dart';

class PulseAnim extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  const PulseAnim({Key? key, required this.animation, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (BuildContext context, Widget? animatedWidget) {
          return Transform.scale(
            child: animatedWidget,
            scale: animation.value,
          );
        });
  }
}
