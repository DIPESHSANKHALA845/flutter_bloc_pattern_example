import 'package:bloc_pattern/utils/globals.dart';
import 'package:bloc_pattern/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart' as dio;
import '../../constant/app_constants.dart';
import '../../data/repository/user_api.dart';
import '../../models/login_response.dart';
import '../../routes/app_routes.dart';
import '../../storage/shared_preference.dart';
import '../../utils/loading_overlay.dart';
import '../../utils/navigation.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState().init());

  BuildContext? _context;
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void init(BuildContext context){
    _context=context;
  }

  void toggleObscure() {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void navigateToForgetView() {
    //Navigate to Forget Password Screen
  }
  void navigateToRegistrationView() {
    //Navigate to Registration Screen
    Logger.log('navigateToRegistrationView');
  }
  String? validateField(String value) {
    if (value.toString().trim().isEmpty) {
      return AppConstants.stringConstant.theEmailFieldMustBeRequired;
    } else if (Globals.isEmail(value)) {
      return null;
    } else {
      return AppConstants.stringConstant.enterValidEmailAddress;
    }
  }

  void validation() async {
    if (formKey.currentState?.validate() ?? false) {
      loginUserRequested();
    }
  }
  void navigateToPostList(){
    NavigationService.instance.navigateTo(AppRoutes.postList);
  }

  Future<dio.Response?> loginUserRequested() async {
    LoadingOverlay.show(_context!);
    Map<String, dynamic> params = {
      "email": emailCtrl.text.toString().trim(),
      "password": passCtrl.text.trim()
    };
    dio.Response? response = await UserApi.instance.loginUserRequested(params);

    if (response?.statusCode == 200 && response?.data != null) {

      LoadingOverlay.hide();
      LoginResponse res = LoginResponse.fromJson(response?.data);

      if(res.error==0){

        UserPreference.setIntPref(UserPreference.userId,res.result?.id??0);
        UserPreference.setStringPref(UserPreference.accessToken,res.result?.authToken??'');
        navigateToPostList();
        Globals.showToastMessageShort(AppConstants.stringConstant.login);
      }else{
        Globals.showToastMessageShort(res.msg??'');
      }
    }else if(response?.statusCode == 401 && response?.data != null) {
      LoadingOverlay.hide();
      Globals.showToastMessageShort(response?.data.toString()??'');
    } else {
      LoadingOverlay.hide();
      try {
        Globals.showToastMessageShort(AppConstants.stringConstant.somethingWentWrong);
      } catch (e) {
        Logger.log (e.toString());
      }
    }
    return response;
  }

}
