import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  IconData icon;
  void Function()? suffixOnTap;
  CustomIcon({super.key, required this.icon, required this.suffixOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(.02),
        ),
        child: IconButton(
            splashRadius: 25,
            highlightColor: Colors.transparent,
            splashColor: Colors.white.withOpacity(0.05),
            onPressed: suffixOnTap,
            icon: Icon(
              icon,
              size: 32,
            )));
  }
}
