import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class NotesModalSheet extends StatelessWidget {
  NotesModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              CustomTextField(labelText: 'Title'),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                maxLines: 6,
                labelText: 'Note',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(buttonName: "Add"),
            ],
          ),
        ),
      ),
    );
  }
}
