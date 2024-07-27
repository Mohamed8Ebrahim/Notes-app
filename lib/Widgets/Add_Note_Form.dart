// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/Cubits/Add_Note_Cubit/Add_Note_Cubit.dart';
import 'package:notes/Cubits/Add_Note_Cubit/Add_Note_State.dart';
import 'package:notes/Models/Notes_Model.dart';
import 'package:notes/Widgets/Colors_List_View.dart';
import 'package:notes/Widgets/Custom_Button.dart';
import 'package:notes/Widgets/Custom_TextField.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Title',
              maxLines: 1,
              onSaved: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              hintText: 'Content',
              maxLines: 5,
              onSaved: (value) {
                subTitle = value;
              },
            ),
            const SizedBox(
              height: 72,
            ),
           const ColorListView(),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<AddNotesCubit, AddNotesState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is NotesLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      addNoteToNotesView(context);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void addNoteToNotesView(BuildContext context) {
    var currentDate = DateTime.now();
    var formattedDate = DateFormat('E  dd,yyyy').format(currentDate);
    var noteModel = NotesModel(
        title: title!,
        subtitle: subTitle!,
        date: formattedDate,
        color: Colors.yellow.value);
    BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
  }
}


