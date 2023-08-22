import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/edit_note.dart';

import '../widgets/notes_app_bar.dart';

class EditNotes extends StatelessWidget {
  final NotesModel note;
  const EditNotes({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
            bottom: 0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomAppBar(
                appBarName: "Edit Note",
                suffixIcon: Icons.cancel_outlined,
                suffixOnTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              EditNoteBody(note: note),
            ],
          ),
        ),
      ),
    );
  }
}
