import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  int? maxLines;
  String labelText;
  void Function(String?)? onSaved;
  CustomTextField(
      {super.key,
      @required this.maxLines,
      required this.labelText,
      @required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "ivalid data";
        } else {
          return null;
        }
      },
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
