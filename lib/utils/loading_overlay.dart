import 'package:bloc_pattern/constant/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navigation.dart';

class LoadingOverlay {

  static void hide() {
    NavigationService.instance.pop();
  }

  static void show(BuildContext context,{String? message}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return message!=null
            ?CupertinoAlertDialog(
          title: Text(message),
          content: Center(child: CircularProgressIndicator(color: AppConstants.colorStyle.primaryColor,)),
        ): Center(child: CircularProgressIndicator(color: AppConstants.colorStyle.primaryColor,)); // Step 3: Return your Custom Dialog Widget here
      },
    );
  }

  static getProgressBar(){
    return Center(child: CircularProgressIndicator(color: AppConstants.colorStyle.primaryColor,));
  }
}