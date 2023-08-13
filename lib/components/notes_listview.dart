import 'package:flutter/material.dart';

import 'notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  final data = const [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: NotesItem(),
        );
      }),
    );
  }
}
