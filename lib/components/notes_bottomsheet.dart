import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

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
                labelText: 'Content',
              ),
              TextButton(
                style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(OvalBorder())),
                onPressed: () {},
                child: const Text(
                  "Add",
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
