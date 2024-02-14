import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Cubits/Notes_Cubit/Notes_Cubit.dart';
import 'package:notes/Models/Notes_Model.dart';
import 'package:notes/Widgets/Custom_Search.dart';
import 'package:notes/Widgets/Custom_TextField.dart';
import 'package:notes/Widgets/Edit_Note_Colors_List.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });
  final NotesModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  int? color;
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.subtitle);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Edit Note', style: TextStyle(fontSize: 30)),
              CustomSearch(
                icon: Icons.done,
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subtitle = content ?? widget.note.subtitle;
                  widget.note.color = color ?? widget.note.color;

                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            controller: titleController,
            maxLines: 1,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            controller: contentController,
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          EditNoteColorsList(
            color: widget.note,
          )
        ],
      ),
    );
  }
}
