import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/components/custom_button.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import '../components/custom_textfield.dart';
import '../constants.dart';
import '../models/notes_model.dart';

class EditNoteBody extends StatefulWidget {
  final NotesModel note;

  const EditNoteBody({super.key, required this.note});

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title, subTitle;
  late Color dialogPickerColor;

  @override
  void initState() {
    super.initState();
    int noteColor = widget.note.color; // Storing the color value here
    dialogPickerColor =
        Color(noteColor); // Using it here to initialize dialogPickerColor
  }

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
            if (value.isEmpty) {
              title = widget.note.title;
            } else {
              title = value;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          initialValue: widget.note.subTitle,
          onChanged: (value) {
            if (value.isEmpty) {
              subTitle = widget.note.subTitle;
            } else {
              subTitle = value;
            }
          },
          labelText: "Content",
          maxLines: 6,
        ),
        const SizedBox(
          height: 30,
        ),
        ListTile(
          title: const Text('Click on the box to change the color'),
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
          height: 30,
        ),
        CustomButton(
          buttonName: "Save",
          onPressed: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.subTitle = subTitle ?? widget.note.subTitle;
            widget.note.color = dialogPickerColor.value;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
        ),
      ],
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
