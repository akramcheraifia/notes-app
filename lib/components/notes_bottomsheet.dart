import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/notes_model.dart';

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
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('failed');
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: Form(
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
                              BlocProvider.of<AddNoteCubit>(context).addNote(
                                  NotesModel(
                                      title: title!,
                                      subTitle: subTitle!,
                                      date: DateTime.now().toString(),
                                      color: Colors.blue.value));
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
            ),
          );
        },
      ),
    );
  }
}
