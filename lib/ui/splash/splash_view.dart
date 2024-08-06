import 'package:bloc_pattern/constant/app_constants.dart';
import 'package:bloc_pattern/extensions/space_extension.dart';
import 'package:bloc_pattern/ui/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (BuildContext context) => SplashCubit()..init(),
      child: BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return _buildPage(context);
      }
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(AppConstants.imageResource.blocLogo,width: 100.w,height: 100.h,),
            20.toSpace,
            Text(
              AppConstants.stringConstant.appName,
              style: AppConstants.txtStyle.getFontStyle(fontSize: 24,
              color: AppConstants.colorStyle.blackColor,
              fontFamily: AppConstants.fontFamily,
              fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}


