// ignore_for_file: must_be_immutable

import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/decoration.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:flutter/material.dart';

class ButtonMenuWidget extends StatelessWidget {
  ButtonMenuWidget({
    required this.onTap,
    required this.icon,
    required this.label,
    super.key,
  });

  Function onTap;
  IconData icon;
  String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: MyDecoration.boxRad10Green,
        child: Row(
          children: [
            Icon(
              icon,
              color: MyColor.mainColor,
            ),
            const SizedBox(width: 40),
            Text(
              label,
              style: MyTextStyle.headerWhiteBold18,
            )
          ],
        ),
      ),
    );
  }
}
