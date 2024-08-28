// ignore_for_file: must_be_immutable

import 'package:demo/constants/style/text_style.dart';
import 'package:flutter/material.dart';

class DataProfileWidget extends StatelessWidget {
  DataProfileWidget({
    required this.data,
    required this.label,
    this.maxLines,
    super.key,
  });
  String label;
  String data;
  int? maxLines = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: MyTextStyle.headerBlackBold18,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            label,
            style: MyTextStyle.headerBlackw40014,
          ),
          const Divider()
        ],
      ),
    );
  }
}
