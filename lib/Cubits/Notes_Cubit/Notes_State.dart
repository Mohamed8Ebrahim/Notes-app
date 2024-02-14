import 'package:flutter/material.dart';
import 'package:notes/Models/Notes_Model.dart';

@immutable
abstract class NotesState {}

class NotesInitialState extends NotesState {}

class NoteSuccessState extends NotesState {
  final List<NotesModel>? notes;

  NoteSuccessState({this.notes});
}
