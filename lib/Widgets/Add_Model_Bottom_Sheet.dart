import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Cubits/Add_Note_Cubit/Add_Note_Cubit.dart';
import 'package:notes/Cubits/Add_Note_Cubit/Add_Note_State.dart';
import 'package:notes/Cubits/Notes_Cubit/Notes_Cubit.dart';
import 'package:notes/Widgets/Add_Note_Form.dart';

class AddModelBottomSheet extends StatelessWidget {
  const AddModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is NotesFailuire) {
          }
          if (state is NotesSuccess) {
            Navigator.pop(context);
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is NotesLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 35,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
