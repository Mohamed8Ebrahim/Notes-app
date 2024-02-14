// NotesCubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes/Constants.dart';
import 'package:notes/Cubits/Notes_Cubit/Notes_State.dart';
import 'package:notes/Models/Notes_Model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitialState());
  List<NotesModel>? noteList;

  fetchAllNotes() async {
    var noteBox = Hive.box<NotesModel>(kNoteBox);
    noteList = noteBox.values.toList();
    emit(NoteSuccessState(notes: noteList));
  }

  searchNotes(String query) async {
    if (query.isEmpty) {
      // If the query is empty, emit the initial state with all notes
      emit(NoteSuccessState(notes: noteList));
      return;
    }

    // Filter notes based on the search query
    final List<NotesModel>? filteredNotes = noteList!
        .where((note) => note.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(NoteSuccessState(notes: filteredNotes));
  }
}
