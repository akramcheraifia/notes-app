part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSuccess extends NotesState {
  final List<NotesModel> notes;

  NotesSuccess(this.notes);
}

final class NotesFailure extends NotesState {
  final String errMsg;

  NotesFailure(this.errMsg);
}
