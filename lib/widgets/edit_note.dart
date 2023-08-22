import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/components/custom_button.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import '../components/custom_textfield.dart';
import '../models/notes_model.dart';

class EditNoteBody extends StatefulWidget {
  final NotesModel note;
  const EditNoteBody({super.key, required this.note});

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        CustomTextField(
          labelText: "Title",
          initialValue: widget.note.title,
          onChanged: (value) {
            title = value;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          initialValue: widget.note.subTitle,
          onChanged: (value) {
            subTitle = value;
          },
          labelText: "Content",
          maxLines: 6,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          buttonName: "Save",
          onPressed: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.subTitle = subTitle ?? widget.note.subTitle;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
