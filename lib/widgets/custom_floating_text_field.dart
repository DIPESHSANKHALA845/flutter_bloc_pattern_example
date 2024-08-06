import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_constants.dart';

class CustomFloatingTextField extends StatelessWidget {
  const CustomFloatingTextField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.errorTextStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.maxLength,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
    this.inputFormatter,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final TextStyle? errorTextStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final int? maxLength;

  final String? hintText;

  final TextStyle? hintStyle;

  final String? labelText;

  final TextStyle? labelStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final FormFieldValidator<String>? onChanged;

  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: floatingTextFieldWidget(context),
          )
        : floatingTextFieldWidget(context);
  }

  Widget floatingTextFieldWidget(BuildContext context){
    return SizedBox(
      width: width ?? double.maxFinite,
      child: TextFormField(
        scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        controller: controller,
        maxLength: maxLength,
        //focusNode: focusNode ?? FocusNode(),
        autofocus: autofocus!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
        obscureText: obscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: decoration(context),
        validator: validator,
        onChanged: onChanged,
        inputFormatters: inputFormatter,
      ),
    );
  }


  InputDecoration decoration(BuildContext context){
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyLarge,
      errorStyle: errorTextStyle ?? AppConstants.txtStyle.fontFamily12_400Red,
      labelText: labelText ?? "",
      labelStyle: labelStyle,
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      isDense: true,
      contentPadding: contentPadding ?? EdgeInsets.all(14.h),
      fillColor: fillColor ?? Colors.white,
      filled: filled,
      border: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.h),
            borderSide: BorderSide(
              color: AppConstants.colorStyle.editBoxBorderColor,
              width: 1,
            ),
          ),
      enabledBorder: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.h),
            borderSide: BorderSide(
              color: AppConstants.colorStyle.editBoxBorderColor,
              width: 1,
            ),
          ),
      focusedBorder: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.h),
            borderSide: BorderSide(
              color: AppConstants.colorStyle.editBoxBorderColor,
              width: 1,
            ),
          ),
      errorBorder: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.h),
            borderSide: BorderSide(
              color: AppConstants.colorStyle.editBoxBorderColor,
              width: 1,
            ),
          ),
    );
  }
}
