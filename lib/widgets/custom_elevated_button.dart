import 'package:flutter/material.dart';
import '../constant/app_constants.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton({super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
  }) : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 48,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle ?? ElevatedButton.styleFrom(
              alignment: Alignment.center,
              elevation: 3,
              textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  height: 1),
              backgroundColor:
              AppConstants.colorStyle.cropperColor,
              shadowColor:
              AppConstants.colorStyle.shadowColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1,
                    color:
                    AppConstants.colorStyle.cropperColor),
                borderRadius: const BorderRadius.all(
                    Radius.circular(20)),
              ),
              minimumSize: const Size.fromHeight(40)),
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text, style: buttonTextStyle ?? AppConstants.txtStyle.getFontStyle(
                fontFamily: AppConstants.fontFamily,
                fontSize: 18,
                color: AppConstants.colorStyle.whiteColor,
                fontWeight: FontWeight.w700,),
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
