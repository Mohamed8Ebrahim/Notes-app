import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Cubits/Notes_Cubit/Notes_Cubit.dart';
import 'package:notes/Models/Notes_Model.dart';
import 'package:notes/Views/Edit_Notes_View.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});
  final NotesModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNotesView(
                note: note,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  note.title,
                  style: const TextStyle(fontSize: 35, color: Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    note.subtitle,
                    style: TextStyle(
                        fontSize: 22, color: Colors.black.withOpacity(0.3)),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
