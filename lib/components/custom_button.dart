import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  String buttonName;
  bool isLoading;
  void Function()? onPressed;
  CustomButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.black),
        onPressed: onPressed,
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.black,
                ),
              )
            : Text(
                buttonName,
                style: const TextStyle(color: Colors.black),
              ));
  }
}
