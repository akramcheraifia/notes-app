import 'package:flutter/material.dart';

import '../components/notes_listview.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: NotesListView());
  }
}
