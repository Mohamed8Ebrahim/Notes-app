// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key, required this.icon, this.onPressed});
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
          child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
      )),
    );
  }
}
