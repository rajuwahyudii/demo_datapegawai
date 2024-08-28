import 'dart:async';

import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/decoration.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:flutter/material.dart';

Future<void> closedAlert(
  BuildContext context, {
  required String title,
  required String textContent,
  required String textButton,
  bool mustTap = true,
  required VoidCallback onPressed,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: mustTap,
    builder: (_) {
      return AlertDialog(
        title: Center(
          child: Text(title),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(textContent),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColor.greenColor,
                foregroundColor: Colors.white,
              ),
              onPressed: onPressed,
              child: Text(textButton),
            )
          ],
        ),
      );
    },
  );
}

Future<void> twoOptionClosetAlert(
  BuildContext context, {
  required String header,
  required String title,
  required String textButton1,
  required String textButton2,
  required VoidCallback onPressedConfirm1,
  required VoidCallback onPressedConfirm2,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return AlertDialog(
        backgroundColor: MyColor.greenColor,
        title: (header.isNotEmpty)
            ? Column(
                children: [
                  Text(
                    header,
                    // style: MyTextStyle.bodyBlackBold14,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  // const Divider(color: MyColor.grey350),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    // style: MyTextStyle.bodyGrey14,
                  ),
                ],
              )
            : Text(
                title,
                // style: MyTextStyle.bodyBlack14,
                textAlign: TextAlign.center,
              ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onPressedConfirm1,
              child: Container(
                width: double.infinity,
                // decoration: MyDecoration.allBorderMain,
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  textButton1,
                  // style: MyTextStyle.captionWhite12,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: onPressedConfirm2,
              child: Container(
                width: double.infinity,
                // decoration: MyDecoration.onlyBorderMain,
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  textButton2,
                  // style: MyTextStyle.captionMain12,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future<void> doubleAlertWithClose(
  BuildContext context, {
  String? title,
  String header = '',
  VoidCallback? onPressedConfirm,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (_) {
      return AlertDialog(
        // backgroundColor: MyColor.secondColor,
        title: (header.isNotEmpty)
            ? Column(
                children: [
                  Text(
                    header,
                    // style: MyTextStyle.bodyBlackBold14,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  // const Divider(color: MyColor.black),
                  const SizedBox(height: 8),
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    // style: MyTextStyle.bodyGrey14,
                  ),
                ],
              )
            : Text(
                title!,
                // style: MyTextStyle.bodyBlack14,
                textAlign: TextAlign.center,
              ),
        content: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  // decoration: MyDecoration.onlyBorderMain,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: const Text(
                    'Tidak',
                    // style: MyTextStyle.captionMain12,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: onPressedConfirm,
                child: Container(
                  // decoration: MyDecoration.allBorderMain,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: const Text(
                    'Lanjutkan',
                    // style: MyTextStyle.captionWhite12,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Future<void> doubleAlert(
  BuildContext context, {
  String? title,
  String? titleButtonLeft,
  String? titleButtonRight,
  VoidCallback? onPressedLeft,
  VoidCallback? onPressedRight,
  bool mustTap = true,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: mustTap,
    builder: (_) {
      return AlertDialog(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: MyTextStyle.headerBlackw40014,
            ),
          ),
        ),
        content: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onPressedLeft,
                child: Container(
                  width: getWidth(context) * 0.25,
                  decoration: MyDecoration.onlyBorderGrey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Text(
                      titleButtonLeft!,
                      textAlign: TextAlign.center,
                      // style: MyTextStyle.captionMain12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onPressedRight,
                child: Container(
                  width: getWidth(context) * 0.25,
                  decoration: MyDecoration.boxGreen,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Text(
                      titleButtonRight!,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.captionWhite12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> successAlert(BuildContext context, String title) async {
  return showDialog(
    context: context,
    builder: (BuildContext contexts) {
      AlertDialog dialog = AlertDialog(
        title: const Icon(
          Icons.check_circle,
          color: MyColor.greenColor,
          size: 40,
        ),
        content: Text(
          title,
          style: MyTextStyle.bodyBlack14,
          textAlign: TextAlign.center,
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(contexts).pop();
      });

      return dialog;
    },
  );
}

Future<void> failedAlert(BuildContext context, String title) async {
  return showDialog(
    context: context,
    builder: (BuildContext builderContext) {
      AlertDialog dialog = AlertDialog(
        title: const Icon(
          Icons.info_outline,
          color: MyColor.redColor,
          size: 40,
        ),
        content: Text(
          title,
          style: MyTextStyle.bodyBlack14,
          textAlign: TextAlign.center,
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(builderContext).pop();
      });

      return dialog;
    },
  );
}
