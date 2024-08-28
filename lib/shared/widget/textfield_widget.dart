import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.controller,
    this.onTap,
    this.onFieldSubmitted,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.errorText,
    this.onChanged,
    this.initialValue,
    this.readOnly = false,
    this.textStyle = MyTextStyle.captionWhiteSemiBold14,
  });

  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final int? maxLength;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final bool readOnly;
  final String? errorText;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      textAlign: textAlign!,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      initialValue: initialValue,
      readOnly: readOnly,
      decoration: InputDecoration(
        errorText: errorText,
        counter: const Offstage(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: MyColor.grayColor),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: MyColor.grayColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: MyColor.grayColor),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        fillColor: MyColor.mainColor,
        filled: true,
        hintText: hint,
        // hintStyle: MyTextStyle.captionGrey12,
      ),
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      // style: MyTextStyle.captionBlack12,
    );
  }
}
