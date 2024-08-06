
import 'package:bloc_pattern/constant/app_constants.dart';
import 'package:bloc_pattern/extensions/space_extension.dart';
import 'package:flutter/material.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.wifi_off_rounded,
              size: 120,
            ),
            20.toSpace,
            Text(AppConstants.stringConstant.noInternet,
            style: AppConstants.txtStyle.getFontStyle(
              fontSize: 20,
              fontFamily: AppConstants.fontFamily,
              fontWeight: FontWeight.w500,
              color: AppConstants.colorStyle.primaryColor
            ),)
          ],
        ),
      ),
    );
  }
}
