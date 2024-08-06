import 'package:dio/dio.dart';
import '../../utils/globals.dart';
import '../../utils/loading_overlay.dart';
import '../../utils/logger.dart';
import '../network/dio_client.dart';
import '../network/dio_exception.dart';

class UserApi {
  static final UserApi instance = UserApi._internal();

  factory UserApi() => instance;

  UserApi._internal();

  Future<Response?> loginUserRequested(Map<String, dynamic> params) async {
    try {
      final Response response = await DioClient.instance.post('login', data: params, options: Options(
              contentType: 'application/json',
              followRedirects: false,
              validateStatus: (status) => true,
              headers: {
                "Access-Control-Allow-Credentials": true,
                "Content-Type": "application/json",
              }));
      Logger.log('loginUserRequested----${response.data}');
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      Logger.log(errorMessage);
      LoadingOverlay.hide();
      if(e.message?.isNotEmpty??false) {
        Globals.showToastMessageShort(e.message!);
      }
      throw errorMessage;
    }
  }
  Future<Response?> postList() async {
    try {
      final Response response = await DioClient.instance.get('posts', options: Options(
          contentType: 'application/json',
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            "Access-Control-Allow-Credentials": true,
            "Content-Type": "application/json",
          }));
      Logger.log('postList----${response.data}');
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      Logger.log(errorMessage);
      LoadingOverlay.hide();
      if(e.message?.isNotEmpty??false) {
        Globals.showToastMessageShort(e.message!);
      }
      throw errorMessage;
    }
  }
}
