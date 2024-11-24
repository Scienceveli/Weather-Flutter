import 'package:flutter/material.dart';

class CustomInfoColumn extends StatelessWidget {
  const CustomInfoColumn({
    super.key,
    required this.friends,
    required this.tax,
    required this.tip,
    this.textStyle,
  });

  final String friends;
  final String tax;
  final String tip;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            friends,
            style: textStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white,
                ),
          ),
          Text(
            tax,
            style: textStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white,
                ),
          ),
          Text(
            tip,
            style: textStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
