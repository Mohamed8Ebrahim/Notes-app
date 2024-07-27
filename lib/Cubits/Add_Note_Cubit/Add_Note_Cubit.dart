
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/Constants.dart';
import 'package:notes/Cubits/Add_Note_Cubit/Add_Note_State.dart';
import 'package:notes/Models/Notes_Model.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(NotesIntial()); // Fixed the typo here
  Color? color =const Color(0xFF0077b6);
  addNote(NotesModel note) async {
    note.color = color!.value;
    emit(NotesLoading());
    try {
      var notesBox = Hive.box<NotesModel>(kNoteBox);
      await notesBox.add(note);
      
      emit(NotesSuccess());
    } catch (e) {
      emit(NotesFailuire(e.toString())); // Fixed the typo here
    }
  }
}
