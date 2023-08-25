import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import '../constants.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class NotesModalSheet extends StatefulWidget {
  const NotesModalSheet({super.key});

  @override
  State<NotesModalSheet> createState() => _NotesModalSheetState();
}

class _NotesModalSheetState extends State<NotesModalSheet> {
  String? title, subTitle;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  Color dialogPickerColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {}
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
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
                        ListTile(
                          title: const Text(
                              'Click on the box to change the color'),
                          trailing: ColorIndicator(
                            width: 44,
                            height: 44,
                            borderRadius: 4,
                            color: dialogPickerColor,
                            onSelectFocus: false,
                            onSelect: () async {
                              // Store current color before we open the dialog.
                              final Color colorBeforeDialog = dialogPickerColor;
                              // Wait for the picker to close, if dialog was dismissed,
                              // then restore the color we had before it was opened.
                              if (!(await colorPickerDialog())) {
                                setState(() {
                                  dialogPickerColor = colorBeforeDialog;
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<AddNoteCubit, AddNoteState>(
                          builder: (context, state) {
                            return CustomButton(
                              isLoading: state is AddNoteLoading ? true : false,
                              buttonName: "Add",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  BlocProvider.of<AddNoteCubit>(context)
                                      .addNote(NotesModel(
                                          title: title!,
                                          subTitle: subTitle!,
                                          date: DateFormat.yMd()
                                              .format(DateTime.now()),
                                          color: dialogPickerColor.value));
                                } else {
                                  autovalidateMode = AutovalidateMode.always;
                                  setState(() {});
                                }
                              },
                            );
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

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      // Use the dialogPickerColor as start color.
      color: dialogPickerColor,
      // Update the dialogPickerColor using the callback.
      onColorChanged: (Color color) =>
          setState(() => dialogPickerColor = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: false,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodySmall,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      customColorSwatchesAndNames: colorsNameMap,
    ).showPickerDialog(
      context,
      backgroundColor: kSecondartyColor,
      // New in version 3.0.0 custom transitions support.
      transitionBuilder: (BuildContext context, Animation<double> a1,
          Animation<double> a2, Widget widget) {
        final double curvedValue =
            Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      constraints:
          const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
    );
  }
}
