

import '../utils/logger.dart';

class LoginResponse {
  int? error;
  Result? result;
  String? msg;

  LoginResponse({this.error, this.result});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json['error']??0;
    msg = json['msg']??'';
    try{
      result = json['result'] != null ? Result.fromJson(json['result']) : null;
    }catch(e){
      Logger.log('result Error=$e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  String? authToken;
  String? qrcode;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? birthday;
  String? lastVisit;
  String? newsLetters;
  String? termsConditions;
  int? status;
  String? createdAt;
  String? updatedAt;

  Result(
      {this.id,
      this.authToken,
      this.qrcode,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.birthday,
      this.lastVisit,
      this.newsLetters,
      this.termsConditions,
      this.status,
      this.createdAt,
      this.updatedAt});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    authToken = json['auth_token']??'';
    qrcode = json['qrcode']??'';
    firstName = json['first_name']??'';
    lastName = json['last_name']??'';
    phoneNumber = json['phone_number']??'';
    email = json['email']??'';
    birthday = json['birthday']??'';
    lastVisit = json['last_visit']??'';
    newsLetters = json['news_letters'].toString();
    termsConditions = json['terms_conditions'].toString();
    status = json['status']??0;
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['auth_token'] = authToken;
    data['qrcode'] = qrcode;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['birthday'] = birthday;
    data['last_visit'] = lastVisit;
    data['news_letters'] = newsLetters;
    data['terms_conditions'] = termsConditions;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}