import 'package:bmi_calculator/Constant/app_constant.dart';
import 'package:bmi_calculator/Widget/left_Bar.dart';
import 'package:bmi_calculator/Widget/right_Bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightcontroller = TextEditingController();
  final TextEditingController _weightcontroller = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
              color: accentHexColor, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: _heightcontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w800),
                      ),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: _weightcontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w800),
                      ),
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  double h = double.parse(_heightcontroller.text);
                  double w = double.parse(_weightcontroller.text);
                  setState(() {
                    _bmiResult = w / (h * h);
                    if (_bmiResult > 25) {
                      _textResult = "You\'re Over Weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "You Have Normal Weight";
                    } else {
                      _textResult = "You\'re Under Weight";
                    }
                  });
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: accentHexColor),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: accentHexColor),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: accentHexColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const LeftBar(barWidth: 25),
              const SizedBox(
                height: 20,
              ),
              const LeftBar(barWidth: 60),
              const SizedBox(
                height: 20,
              ),
              const LeftBar(barWidth: 25),
              const SizedBox(
                height: 20,
              ),
              const RightBar(barWidth: 70),
              const SizedBox(
                height: 30,
              ),
              const RightBar(barWidth: 60)
            ],
          ),
        ),
      ),
    );
  }
}
