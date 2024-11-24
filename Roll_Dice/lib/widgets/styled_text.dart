// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key, required this.text});
  final text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
