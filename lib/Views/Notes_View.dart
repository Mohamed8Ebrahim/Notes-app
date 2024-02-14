import 'package:flutter/material.dart';
import 'package:notes/Widgets/Add_Model_Bottom_Sheet.dart';
import 'package:notes/Widgets/Custom_Notes_Niew.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const AddModelBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: const CustomNotesView(),
    );
  }
}
