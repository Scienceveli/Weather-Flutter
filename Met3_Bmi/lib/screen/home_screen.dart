// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:met_bmi/style/style.dart';
import '../components/layout_container.dart';
import '../components/data_container.dart';
import 'package:http/http.dart' as http;

const activeColor = Color.fromARGB(255, 221, 118, 0);
const inActiveColor = Color(0xFF212121);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  int height = 130;
  int weight = 35;
  int age = 15;
  String result = "";
  String resultDetail = "";
  double bmi = 0;
  List<String> quotes = [];

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  Future<void> fetchQuotes() async {
    try {
      final response =
          await http.get(Uri.parse('https://zenquotes.io/api/random'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          quotes =
              data.map((quote) => "${quote['q']} - ${quote['a']}").toList();
        });
      } else {
        if (kDebugMode) {
          print('Failed to load quotes. Status Code: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching quotes: $error');
      }
    }
  }

  String calculateBmi(int weight, int height) {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(1);
                    });
                  },
                  child: LayoutContainer(
                    boxColor: maleBoxColor,
                    childwidget:
                        const DataContainer(icon: Icons.male, title: 'MALE'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(2);
                    });
                  },
                  child: LayoutContainer(
                    boxColor: femaleBoxColor,
                    childwidget: const DataContainer(
                        icon: Icons.female, title: 'FEMALE'),
                  ),
                ),
              ),
            ],
          ),
          LayoutContainer(
            boxColor: inActiveColor,
            childwidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'HEIGHT',
                  style: AppTextStyle.textStyle1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Slider(
                      value: height.toDouble(),
                      allowedInteraction: SliderInteraction.slideThumb,
                      min: 100,
                      max: 250,
                      activeColor: activeColor,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                    Text(
                      height.toString(),
                      style: AppTextStyle.textStyle2,
                    ),
                    const Text(
                      'cm',
                      style: AppTextStyle.textStyle1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: LayoutContainer(
                    boxColor: inActiveColor,
                    childwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: AppTextStyle.textStyle1,
                        ),
                        Text(
                          age.toString(),
                          style: AppTextStyle.textStyle3,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  });
                                },
                                backgroundColor: activeColor,
                                child: const Icon(Icons.remove,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (age < 100) {
                                      age++;
                                    }
                                  });
                                },
                                backgroundColor: activeColor,
                                child:
                                    const Icon(Icons.add, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutContainer(
                    boxColor: inActiveColor,
                    childwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: AppTextStyle.textStyle1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: AppTextStyle.textStyle3,
                            ),
                            const Text(
                              ' KG',
                              style: AppTextStyle.textStyle3,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    }
                                  });
                                },
                                backgroundColor: activeColor,
                                child: const Icon(Icons.remove,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: activeColor,
                                child:
                                    const Icon(Icons.add, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutContainer(
              boxColor: inActiveColor,
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Quote of the day !!',
                    style: AppTextStyle.textStyle1,
                  ),
                  if (quotes.isNotEmpty)
                    Text(
                      quotes.first.toString(),
                      style: AppTextStyle.textStyle1,
                    ),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  result = calculateBmi(weight, height);
                  showDialog(
                      context: context,
                      builder: (BuildContext contest) {
                        return Dialog(
                            backgroundColor: inActiveColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              color: inActiveColor,
                              height: 200.0,
                              margin: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'Your BMI result are',
                                    style: AppTextStyle.textStyle1,
                                  ),
                                  Text(
                                    result.toString(),
                                    style: AppTextStyle.textStyle2,
                                  ),
                                ],
                              ),
                            ));
                      });
                });
              },
              child: Container(
                width: double.infinity,
                height: 80.0,
                color: activeColor,
                margin: const EdgeInsets.only(top: 10.0),
                child: const Center(
                  child: Text(
                    'Calculate BMI',
                    style: AppTextStyle.textStyle3,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
