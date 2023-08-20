import 'package:flutter/material.dart';

import '../models/notes_model.dart';
import '../views/edit_notes_view.dart';

class NotesItem extends StatelessWidget {
  NotesItem({super.key, required this.note});
  NotesModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const EditNotes();
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 16,
        ),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
            title: Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
              ),
              child: Text(note.subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.55),
                    fontSize: 15,
                  )),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outlined,
                  color: Color.fromARGB(255, 177, 32, 22),
                  size: 30,
                )),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.55),
                  fontSize: 14,
                )),
          )
        ]),
      ),
    );
  }
}
