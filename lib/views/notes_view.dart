import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/notes_body.dart';
import '../components/notes_bottomsheet.dart';
import '../widgets/notes_app_bar.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          showModalBottomSheet(
              enableDrag: true,
              showDragHandle: true,
              backgroundColor: kSecondartyColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const NotesModalSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
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
              appBarName: "Notes",
              suffixIcon: Icons.search,
              suffixOnTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomBody(),
          ],
        ),
      ),
    );
  }
}
