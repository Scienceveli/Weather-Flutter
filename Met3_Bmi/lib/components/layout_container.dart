import 'package:flutter/material.dart';

class LayoutContainer extends StatelessWidget {
  const LayoutContainer(
      {super.key, required this.boxColor, required this.childwidget});

  final Color boxColor;
  final Widget childwidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: boxColor,
      ),
      child: childwidget,
    );
  }
}
