import 'package:demo/constants/style/color.dart';
import 'package:flutter/material.dart';

class MyDecoration {
  static final BoxDecoration boxRad10Grey = BoxDecoration(
    color: MyColor.grayColor,
    borderRadius: BorderRadius.circular(10),
  );

  static final BoxDecoration boxRad10White = BoxDecoration(
    color: MyColor.mainColor,
    borderRadius: BorderRadius.circular(10),
  );
  static final BoxDecoration boxRad100White = BoxDecoration(
    color: MyColor.mainColor,
    borderRadius: BorderRadius.circular(100),
  );

  static const BoxDecoration lrboxRad14hite = BoxDecoration(
    color: MyColor.mainColor,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14), topRight: Radius.circular(14)),
  );

  static final BoxDecoration boxRad10Green = BoxDecoration(
    color: MyColor.greenColor,
    borderRadius: BorderRadius.circular(10),
  );
  static final BoxDecoration onlyBorderGrey = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: MyColor.grayColor),
  );

  static final BoxDecoration boxGreen = BoxDecoration(
    color: MyColor.greenColor,
    borderRadius: BorderRadius.circular(5),
  );
}
