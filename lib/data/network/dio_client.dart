import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../constant/app_constants.dart';
import '../../utils/globals.dart';
import '../../utils/logger.dart';
import 'dio_exception.dart';

class DioClient {
  /// dio instance create
  final Dio _dio = Dio();

  static final DioClient instance = DioClient._internal();

  factory DioClient() => instance;

  DioClient._internal(){
    _dio
      ..options.baseUrl = AppConstants.endPoints.baseUrl
      ..interceptors.add(
        LogInterceptor(
          logPrint: (o) => Logger.log(o.toString()),
        ),
      )
      ..options.connectTimeout = Duration(seconds: AppConstants.endPoints.connectionTimeout)
      ..options.receiveTimeout = Duration(seconds: AppConstants.endPoints.receiveTimeout)
      ..options.headers = {'user-agent': 'dio'}
      ..options.headers = {'Accept': 'application/json'}
      ..options.headers = {'Content-Type': 'application/json'}
      ..options.preserveHeaderCase = false
      ..options.responseType = ResponseType.json;
  }

  /*DioClient(this._dio) {

  }*/

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Logger.log('URL-> $url');
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: {
          //'Authorization': 'Bearer ${UserPreference.getAccessToken()}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Logger.log('URL-> $url\nRequest-> $data');
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

// Put:-----------------------------------------------------------------------
  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

// Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> postWithAuth(
    String url,{
    data, Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
        BuildContext? context,
  }) async {
    try {
      Logger.log('URL-> $url\nRequest-> $data');
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      Globals.showToastMessageLong(errorMessage.toString());
      throw errorMessage;
    }
  }

// Put:-----------------------------------------------------------------------
  Future<Response> putWith(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Logger.log('URL-> $url\nRequest-> ${data.toString()}');
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
