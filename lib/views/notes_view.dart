import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_body.dart';

import '../widgets/notes_app_bar.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          top: 16,
          right: 16,
          left: 16,
          bottom: 0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomAppBar(),
            SizedBox(
              height: 10,
            ),
            CustomBody(),
          ],
        ),
      ),
    );
  }
}
