import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/app_constants.dart';

class AppTheme {
  static final defaultTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppConstants.colorStyle.secondaryColor,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: AppConstants.colorStyle.primaryColor,
              // fontFamily: Constants.fontAlumniSans,
              fontSize: ScreenUtil().setSp(25),
              fontWeight: FontWeight.w600),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, //top bar color
            statusBarIconBrightness: Brightness.light, //top bar icons color
            //   statusBarIconBrightness: Brightness.dark, //top bar icons
          ),
          centerTitle: true,
          // color: ColorStyle.textFieldColor,
          elevation: 0.0));

}
