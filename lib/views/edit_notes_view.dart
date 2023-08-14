import 'package:flutter/material.dart';
import 'package:notes_app/widgets/edit_note.dart';

import '../widgets/notes_app_bar.dart';

class EditNotes extends StatelessWidget {
  EditNotes({super.key});
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
                icon: Icons.delete,
              ),
              const SizedBox(
                height: 10,
              ),
              const EditNoteBody(),
            ],
          ),
        ),
      ),
    );
  }
}
