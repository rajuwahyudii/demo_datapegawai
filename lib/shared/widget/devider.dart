// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DeviderWidget extends StatelessWidget {
  DeviderWidget({
    required this.width,
    this.vPadding,
    this.thickness,
    super.key,
  });
  double width;
  double? vPadding = 16;
  double? thickness = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: vPadding!),
      width: width,
      child: Divider(
        height: 2,
        thickness: thickness,
      ),
    );
  }
}
