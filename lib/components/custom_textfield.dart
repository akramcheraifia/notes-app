import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  int? maxLines;
  String labelText;
  CustomTextField(
      {super.key, @required this.maxLines, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      cursorColor: kPrimaryColor,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff374674),
        focusColor: kLightGreyColor,
        // hoverColor: Color(0xff374674),
        labelText: labelText,
        labelStyle: const TextStyle(color: kLightGreyColor),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kSecondartyColor,
          ),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kSecondartyColor,
          ),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kSecondartyColor,
          ),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
      ),
    );
  }
}
