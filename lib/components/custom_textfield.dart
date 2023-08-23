import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  int? maxLines;
  String labelText;
  TextEditingController? controller;
  void Function(String)? onChanged;
  void Function(String?)? onSaved;
  String? initialValue;
  CustomTextField(
      {super.key,
      @required this.maxLines,
      required this.labelText,
      this.onChanged,
      this.initialValue,
      @required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
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
