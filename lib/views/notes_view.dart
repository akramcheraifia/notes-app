import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

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
            CustomAppBar()
          ],
        ),
      ),
    );
  }
}
