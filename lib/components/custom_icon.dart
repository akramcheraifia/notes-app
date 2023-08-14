import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  IconData icon;
  CustomIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(.08),
        ),
        child: IconButton(
            hoverColor: Colors.white,
            onPressed: () {},
            icon: Icon(
              icon,
              size: 28,
            )));
  }
}
