// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:notes/Models/Notes_Model.dart';
import 'package:notes/Widgets/Edit_Note_View_Body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key, required this.note});
  final NotesModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
