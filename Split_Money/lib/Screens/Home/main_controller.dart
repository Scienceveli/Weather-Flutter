// GetX
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var currentSliderValue = 1.obs;
  var taxAmount = 0.obs;
  // Increase taxAmount value
  void tipIncrease() {
    taxAmount.value++;
  }

  // Decrease value
  void taxDecrease() {
    if (taxAmount.value == 0) {
    } else {
      taxAmount.value--;
    }
  }

  TextEditingController tipAmountController = TextEditingController();

  var tipAmount = '0'.obs;

  TextEditingController totalAmountController = TextEditingController();

  var totalAmount = '0'.obs;

  // Calculations for getting equally divided amount for each friend
  String equallyDivide() {
    try {
      var preEquallyDivided =
          (double.parse(totalAmount.value) / 100 * taxAmount.value) +
              double.parse(totalAmount.value) +
              double.parse(tipAmount.value);

      var equallyDivided = preEquallyDivided / currentSliderValue.value;

      return equallyDivided.toPrecision(2).toString();
    } catch (e) {
      return e.toString();
    }
  }
}
