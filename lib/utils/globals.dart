
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constant/app_constants.dart';

class Globals {
 static void fieldFocusChange(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
  /// Show toast message for info
 static void showToastMessageLong(String message) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        msg: message,
        backgroundColor: AppConstants.colorStyle.blackColor,
        textColor: AppConstants.colorStyle.whiteColor.withOpacity(0.8));
  }
  /// Show toast message for info
 static void showToastMessageShort(String message) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_SHORT,
        msg: message,
        backgroundColor: AppConstants.colorStyle.blackColor,
        textColor: AppConstants.colorStyle.whiteColor.withOpacity(0.8));
  }
 static bool isEmail2(String s) {
   return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(s);
 }
 static bool isEmail(String s) {
   return RegExp(
       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
   ).hasMatch(s) && !RegExp(
       r'(\.\w{2,}\.\w{2,})$'
   ).hasMatch(s);
 }
}