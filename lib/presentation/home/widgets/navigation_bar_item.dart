import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final String label;
  final IconData iconName;
  final bool isSelected;

  const NavBarItem(
      {Key? key,
      required this.label,
      required this.iconName,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 600),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: const Color(0xFFE3F6FD),
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ),
        NavigationDestination(
          icon: Icon(
            iconName,
            color: const Color(0xFFF1F1F1),
          ),
          label: "",
          selectedIcon: Icon(
            iconName,
            color: const Color(0xFF131112),
          ),
        ),
      ],
    );
  }
}
