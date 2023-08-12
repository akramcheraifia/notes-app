import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_body.dart';

import '../widgets/notes_app_bar.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
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
