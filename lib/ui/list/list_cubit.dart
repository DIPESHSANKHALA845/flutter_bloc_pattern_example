import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart' as dio;
import '../../constant/app_constants.dart';
import '../../data/repository/user_api.dart';
import '../../models/list_response.dart';
import '../../utils/globals.dart';
import '../../utils/logger.dart';
import 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListState().init());



  Future<dio.Response?> listPostAPI() async {

    dio.Response? response = await UserApi.instance.postList();

    if (response?.statusCode == 200 && response?.data != null) {

      List<dynamic> jsonData = response?.data is String
          ? json.decode(response?.data as String)
          : response?.data;
      // Convert JSON to List of Post objects
      List<ListResponse> posts = jsonData.map((item) => ListResponse.fromJson(item)).toList();

      emit(state.copyWith(list: posts));
    }else if(response?.statusCode == 401 && response?.data != null) {

      Globals.showToastMessageShort(response?.data.toString()??'');
    } else {
      try {
        Globals.showToastMessageShort(AppConstants.stringConstant.somethingWentWrong);
      } catch (e) {
        Logger.log (e.toString());
      }
    }
    return response;
  }
}
