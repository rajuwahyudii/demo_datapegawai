// ignore_for_file: must_be_immutable

import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/decoration.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:flutter/material.dart';

class HomeFloatingButton extends StatelessWidget {
  HomeFloatingButton({
    required this.icon,
    required this.title,
    required this.function,
    super.key,
  });
  IconData icon;
  String title;
  Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        decoration: MyDecoration.boxRad10Green,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: MyColor.mainColor,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: MyTextStyle.captionWhiteSemiBold14,
            )
          ],
        ),
      ),
    );
  }
}
