import 'package:flutter/material.dart';
import 'package:met_bmi/style/style.dart';

class DataContainer extends StatelessWidget {
  const DataContainer({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 80.0,
            color: Colors.white,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(title, style: AppTextStyle.textStyle1),
        ],
      ),
    );
  }
}
