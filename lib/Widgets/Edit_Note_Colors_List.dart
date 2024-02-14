import 'package:flutter/material.dart';
import 'package:notes/Constants.dart';
import 'package:notes/Models/Notes_Model.dart';
import 'package:notes/Widgets/Colors_List_View.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.color});
  final NotesModel color;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.color.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: kColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.color.color = kColors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: kColors[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
