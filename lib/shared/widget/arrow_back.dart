// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ArrowBackWidget extends StatelessWidget {
  Color color;

  ArrowBackWidget({
    required this.color,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        color: color,
        Icons.arrow_back_ios,
      ),
    );
  }
}
