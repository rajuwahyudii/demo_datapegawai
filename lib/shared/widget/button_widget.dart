// ignore_for_file: must_be_immutable

import 'package:demo/constants/font/font_family.dart';
import 'package:demo/constants/style/color.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    required this.label,
    required this.function,
    this.color,
    this.textColor,
    super.key,
  });
  String label;
  Function function;
  Color? color = MyColor.mainColor;
  Color? textColor = MyColor.greenColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: poppinsBold,
            ),
          ),
        ),
      ),
    );
  }
}
