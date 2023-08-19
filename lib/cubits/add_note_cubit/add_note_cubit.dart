import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../models/notes_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NotesModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NotesModel>('notes');
      emit(AddNoteSuccess());
      await notesBox.add(note);
    } on Exception catch (e) {
      AddNoteFailure(e.toString());
    }
  }
}
