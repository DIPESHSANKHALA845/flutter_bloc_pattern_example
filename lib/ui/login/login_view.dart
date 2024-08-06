import 'package:bloc_pattern/extensions/space_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/app_constants.dart';
import '../../utils/globals.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit()..init(context),
      child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return _buildPage(context,state);
          }
      )
    );
  }

  Widget _buildPage(BuildContext context,LoginState state) {
    final controller = context.read<LoginCubit>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: controller.formKey,
          child: GestureDetector(
            onTap: () {
              Globals.fieldFocusChange(context);
            },
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 29),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.h, vertical: 41),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          60.toSpace,
                          CustomImageView(
                              imagePath: AppConstants.imageResource.blocLogo,
                              height: 100.h,
                              width: 100.w),
                          40.toSpace,
                          CustomFloatingTextField(
                              controller: controller.emailCtrl,
                              labelText:
                                  AppConstants.stringConstant.emailAddress,
                              labelStyle: AppConstants
                                  .txtStyle.fontFamily16_400PrimaryColor,
                              hintText:
                                  AppConstants.stringConstant.emailAddress,
                              hintStyle: AppConstants
                                  .txtStyle.fontFamily16_400PrimaryColor,
                              textStyle: AppConstants
                                  .txtStyle.fontFamily16_400PrimaryColor,
                              textInputType: TextInputType.emailAddress,
                              inputFormatter: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              validator: (value) {
                                return controller.validateField(value!);
                              }),
                          15.toSpace,
                          CustomFloatingTextField(
                            controller: controller.passCtrl,
                            labelText: AppConstants.stringConstant.password,
                            labelStyle:
                                AppConstants.txtStyle.fontFamily16_400PrimaryColor,
                            hintText: AppConstants.stringConstant.password,
                            hintStyle:
                                AppConstants.txtStyle.fontFamily16_400PrimaryColor,
                            textStyle: AppConstants
                                .txtStyle.fontFamily16_400PrimaryColor,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            inputFormatter: [
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            suffix: Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: Transform.scale(
                                scale: 0.65,
                                child: IconButton(
                                  onPressed: () {
                                    controller.toggleObscure();
                                  },
                                  icon: CustomImageView(
                                      imagePath: state.obscureText
                                          ? AppConstants.imageResource.eyeCross
                                          : AppConstants.imageResource.eye,
                                      width: 36.h,
                                  color: AppConstants.colorStyle.primaryColor,),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.toString().trim().isEmpty) {
                                return AppConstants.stringConstant
                                    .thePasswordFieldMustBeRequired;
                              } else if (value.length < 8) {
                                return AppConstants
                                    .stringConstant.atLeast8CharactersRequired;
                              }
                              return null;
                            },
                            obscureText: state.obscureText,
                          ),
                          13.toSpace,
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: EdgeInsets.only(right: 5.h),
                                  child: BaseText(
                                      onTap: () {
                                        controller.navigateToForgetView();
                                      },
                                      text: AppConstants
                                          .stringConstant.forgetPassword,
                                      style: AppConstants
                                          .txtStyle.fontFamily16_400PrimaryColor
                                          .copyWith(
                                              fontWeight: FontWeight.w500)))),
                          16.toSpace,
                          CustomElevatedButton(
                            onPressed: () {
                              Globals.fieldFocusChange(context);
                              controller.validation();
                              //controller.navigateToPostList();
                            },
                            text: AppConstants.stringConstant.login,
                          ),
                          37.toSpace,
                          BaseText(
                              text: AppConstants.stringConstant.loginWith,
                              style: AppConstants
                                  .txtStyle.fontFamily16_400PrimaryColor
                                  .copyWith(
                                      fontSize: 14)),
                          21.toSpace,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                  imagePath:
                                      AppConstants.imageResource.googleIcon,
                                  height: 40.h,
                                  width: 40.w,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 18.h),
                                    child: CustomImageView(
                                      imagePath:
                                          AppConstants.imageResource.fbIcon,
                                      height: 40.h,
                                      width: 40.w,
                                    )),
                              ]),
                          50.toSpace,
                          BaseText(
                              text:
                                  AppConstants.stringConstant.doNotHaveAccount,
                              style: AppConstants
                                  .txtStyle.fontFamily16_400PrimaryColor
                                  .copyWith(fontSize: 14)),
                          9.toSpace,
                          BaseText(
                              onTap: () {
                                controller.navigateToRegistrationView();
                              },
                              text: AppConstants.stringConstant.register,
                              style: AppConstants
                                  .txtStyle.fontFamily16_400PrimaryColor
                                  .copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
