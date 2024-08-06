import 'package:flutter/material.dart';
import '../constant/app_constants.dart';

class BaseText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isUpperCase;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final TextOverflow? overflow;
  final Color? textColor;
  final double? letterSpacing;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final int? maxLines;
  final String? fontFamily;
  final double? lineHeight;
  final List<Shadow>? shadows;
  final Function()? onTap;
  const BaseText({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.style,
    this.overflow = TextOverflow.ellipsis,
    this.textColor,
    this.textDecoration = TextDecoration.none,
    this.textDecorationColor,
    this.fontSize = 14,
    this.isUpperCase = false,
    this.fontWeight,
    this.letterSpacing,
    this.maxLines = 20,
    this.fontFamily = 'DmSansFamily',
    this.lineHeight,
    this.shadows,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: style ??
            getBaseTextStyle(),
      ),
    );
  }

  TextStyle getBaseTextStyle(){
    return TextStyle(
      height: lineHeight,
      shadows: shadows,
      color: textColor ?? AppConstants.colorStyle.whiteColor,
      decoration: textDecoration,
      fontFamily: fontFamily,
      fontSize: fontSize,
      letterSpacing: letterSpacing ?? 0.0,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}
