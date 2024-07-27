// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:notes/Constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    required this.maxLines,
    this.onSaved,
    this.onChanged,
    this.controller,
  });
  final String? hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field cannot be empty";
        }

        return null;
      },
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: kPrimaryColor),
        enabledBorder: addOutlineInputBorder(),
        focusedBorder: addOutlineInputBorder(color: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder addOutlineInputBorder({color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
