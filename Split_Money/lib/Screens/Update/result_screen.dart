import 'package:flutter/material.dart';
//Get
import 'package:get/get.dart';
import 'package:split_money/Components/action_button.dart';
import 'package:split_money/Components/custom_cardtext.dart';
//Models
import 'package:split_money/Models/result_model.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.resultData});

  final ResultData resultData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrange,
        centerTitle: false,
        title: const Text(
          'Result ',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue.shade700.withOpacity(0.8),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Equally Divided',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              Text(
                                '${resultData.equalDivided} ₹',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Row(
                          children: [
                            const CustomInfoColumn(
                              friends: "Friends :-",
                              tax: "Tax :-",
                              tip: "Tip :-",
                            ),
                            CustomInfoColumn(
                              friends: resultData.friends,
                              tax: '${resultData.tax} %',
                              tip: '${resultData.tip} ₹',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        'Everybody Should Pay Only :-  ${resultData.equalDivided} ₹',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CustomActionButton(
                onPressed: () {
                  Get.back();
                },
                text: 'Do You Want Calculate Again ??',
              ),
            ],
          ),
        ),
      )),
    );
  }
}
