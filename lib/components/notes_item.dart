import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 24,
        left: 16,
      ),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        ListTile(
          title: const Text(
            "Flutter Tips",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
            ),
            child: Text('Build your carrer with akram cheraifia',
                style: TextStyle(
                  color: Colors.black.withOpacity(.55),
                  fontSize: 15,
                )),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 30,
              )),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Text('May21 2023',
              style: TextStyle(
                color: Colors.black.withOpacity(.55),
                fontSize: 14,
              )),
        )
      ]),
    );
  }
}
