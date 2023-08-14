import 'package:flutter/material.dart';

import '../components/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  String appBarName;
  IconData icon;
  CustomAppBar({super.key, required this.appBarName, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          appBarName,
          style: const TextStyle(fontSize: 28),
        ),
        CustomIcon(
          icon: icon,
        )
      ],
    );
  }
}
