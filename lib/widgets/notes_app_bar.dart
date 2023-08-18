import 'package:flutter/material.dart';

import '../components/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  String appBarName;
  IconData suffixIcon;
  void Function()? suffixOnTap;
  CustomAppBar(
      {super.key,
      required this.appBarName,
      required this.suffixIcon,
      required this.suffixOnTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          appBarName,
          style: const TextStyle(fontSize: 28),
        ),
        CustomIcon(icon: suffixIcon, suffixOnTap: suffixOnTap)
      ],
    );
  }
}
