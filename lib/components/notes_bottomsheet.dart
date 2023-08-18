import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class NotesModalSheet extends StatefulWidget {
  NotesModalSheet({super.key});

  @override
  State<NotesModalSheet> createState() => _NotesModalSheetState();
}

class _NotesModalSheetState extends State<NotesModalSheet> {
  String? title, subTitle;

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                CustomTextField(
                  labelText: 'Title',
                  onSaved: (value) {
                    title = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  maxLines: 6,
                  labelText: 'Note',
                  onSaved: (value) {
                    subTitle = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonName: "Add",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
