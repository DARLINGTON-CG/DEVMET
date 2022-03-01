import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginButton extends StatefulWidget {
  final VoidCallback? func;
  final bool isSubmissionProgressing;

  const LoginButton(
      {Key? key, required this.func, required this.isSubmissionProgressing})
      : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ScaleTransition(
          scale: controller,
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(15),
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.5),
                shape: BoxShape.circle),
          ),
        ),
        GestureDetector(
          onTap: widget.func,
          child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(15),
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xffe3f6fd), shape: BoxShape.circle),
              child: widget.isSubmissionProgressing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child:
                          CircularProgressIndicator(color: Color(0xFF131112)))
                  : const FaIcon(FontAwesomeIcons.google, color: Colors.black)),
        ),
      ],
    );
  }
}
