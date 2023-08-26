import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';

import 'notes_item.dart';

class CustomSearchHintDelegate extends SearchDelegate<String> {
  CustomSearchHintDelegate({required String hintText})
      : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: const Color(0xff1A2031),
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: kSecondartyColor,
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,

        // Use this change the placeholder's text style
        hintStyle: TextStyle(fontSize: 17),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, 'success');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var notes = BlocProvider.of<NotesCubit>(context).notes;

    var filteredNotes = notes!.where((note) {
      return note.title.startsWith(query);
    }).toList();
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          scrollDirection: Axis.vertical,
          children: List.generate(filteredNotes.length, (index) {
            return NotesItem(
              note: filteredNotes[index],
            );
          })),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    var notes = BlocProvider.of<NotesCubit>(context).notes;

    var filteredNotes = notes!.where((note) {
      return note.title.startsWith(query);
    }).toList();
    return Container(
        margin: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: filteredNotes.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: NotesItem(
                note: filteredNotes[index],
              ),
            );
          }),
        )
        //  ListView(
        //     padding: const EdgeInsets.only(top: 8, bottom: 8),
        //     scrollDirection: Axis.vertical,
        //     children: List.generate(filteredNotes.length, (index) {
        //       return NotesItem(
        //         note: filteredNotes[index],
        //       );
        //     })),
        );
  }
}
