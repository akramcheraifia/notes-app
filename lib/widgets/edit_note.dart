import 'package:flutter/material.dart';
import 'package:notes_app/components/custom_button.dart';

import '../components/custom_textfield.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        CustomTextField(labelText: "Title"),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: "Note",
          maxLines: 6,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          buttonName: "Save",
        ),
      ],
    );
  }
}
