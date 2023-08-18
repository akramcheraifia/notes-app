import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  String buttonName;
  CustomButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.black),
      onPressed: () {},
      child: Text(
        buttonName,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
