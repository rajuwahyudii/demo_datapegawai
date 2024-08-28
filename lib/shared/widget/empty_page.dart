import 'package:demo/constants/asset/images.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      height: getHeight(context),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetImages.imageEmpty,
              width: getWidth(context) * 0.6,
            ),
            const SizedBox(height: 10),
            const Text(
              'Tidak Ada Data',
              style: MyTextStyle.headerGreenBold20,
            ),
          ],
        ),
      ),
    );
  }
}
