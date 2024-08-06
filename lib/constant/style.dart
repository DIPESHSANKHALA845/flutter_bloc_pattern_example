import 'package:bloc_pattern/constant/app_constants.dart';
import 'package:flutter/material.dart';

class TxtStyle {
  final fontFamily12_400Red = TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 12,
      color: Colors.red,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      wordSpacing: 0.0);
  final fontFamily16_400PrimaryColor = TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 16,
      color: AppConstants.colorStyle.primaryColor,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      wordSpacing: 0.0);
  TextStyle getFontStyle(
      {
        double? fontSize,
        Color? color,
        String? fontFamily,
        FontWeight? fontWeight,
        bool? isUnderline}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration:
      isUnderline != null ? TextDecoration.underline : TextDecoration.none,
    );
  }
}