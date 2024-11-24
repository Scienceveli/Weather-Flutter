// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, must_be_immutable
import 'dart:math';

import 'package:flutter/material.dart';

import 'styled_text.dart';

//Globle Variables for Alignment
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatefulWidget {
  const GradientContainer(
      {super.key,
      required this.Color1,
      required this.Color2,
      required this.Color3, // Color Is Set As Required Argument
      required this.Color4});
//? Colour For Body Background Container
  final Color Color1;
  final Color Color2;
  final Color Color3;
  final Color Color4;

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
//? Screen Size
  var size, height, width;
//? Active Image Dices Variable
  var activeImage = 'assets/images/dice5.png';

  void roll() {
    //! Function to roll
    var rendomDices = Random().nextInt(6) +
        1; //Generate a random number between 0 and 6  for each active image in the scene
    setState(() {
      if (activeImage == 'assets/images/dice1.png') {
        activeImage = 'assets/images/dice$rendomDices.png';
      } else {
        activeImage = 'assets/images/dice1.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //? Adjust Size According To Screen By Half / 2
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            widget.Color1,
            widget.Color2,
            widget.Color3,
            widget.Color4,
          ],
          begin: startAlignment, //Called Alignment Varibles
          end: endAlignment,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeImage,
              width: width / 2, // Called ScreenSize Varibles
            ),
            SizedBox(
              height: height * 0.05,
            ),
            TextButton(
              onPressed: roll, //! Function Called here to R0ll
              child: const StyledText(
                text: 'ROLL THE DICE',
              ),
            )
          ],
        ),
      ),
    );
  }
}
