import 'package:flutter/material.dart';

import 'widgets/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roll Dice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: GradientContainer(
          Color1: Colors.yellow,
          Color2: Colors.purple, //Called Required Argument As A Color Value
          Color3: Colors.pink,
          Color4: Colors.blue,
        ),
      ),
    );
  }
}
