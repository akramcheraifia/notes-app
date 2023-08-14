import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  int? maxLines;
  String labelText;
  CustomTextField({@required this.maxLines, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      cursorColor: kPrimaryColor,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: kPrimaryColor),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
      ),
    );
  }
}
