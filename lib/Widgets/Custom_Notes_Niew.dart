// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Cubits/Notes_Cubit/Notes_Cubit.dart';
import 'package:notes/Cubits/Notes_Cubit/Notes_State.dart';
import 'package:notes/Models/Notes_Model.dart';
import 'package:notes/Widgets/Custom_AppBar.dart';
import 'package:notes/Widgets/Custom_NotesItem.dart';

class CustomNotesView extends StatefulWidget {
  const CustomNotesView({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomNotesView> createState() => _CustomNotesViewState();
}

class _CustomNotesViewState extends State<CustomNotesView> {
  @override
  void initState() {
    super.initState();
    context.read<NotesCubit>().fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Notes',
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: BlocBuilder<NotesCubit, NotesState>(
                  builder: (context, state) {
                    if (state is NoteSuccessState) {
                      List<NotesModel> notes = state.notes ?? [];

                      return ListView.builder(
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          return CustomNoteItem(
                            note: notes[index],
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
