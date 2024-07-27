// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Cubits/Notes_Cubit/Notes_Cubit.dart';
import 'package:notes/Cubits/Notes_Cubit/Notes_State.dart';
import 'package:notes/Widgets/Custom_Search.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final void Function()? onPressed;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final NotesCubit notesCubit = BlocProvider.of<NotesCubit>(context);

    return BlocListener<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NoteSuccessState) {
          // No need to maintain a separate search list
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 55),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _isSearching
                ? Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search,...',
                      ),
                      autofocus: true,
                      style: const TextStyle(fontSize: 17, letterSpacing: .5),
                      onChanged: (value) {
                        notesCubit.searchNotes(value);
                      },
                    ),
                  )
                : const Text('Notes', style: TextStyle(fontSize: 30)),
            CustomSearch(
              icon: _isSearching ? Icons.clear : Icons.search,
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
