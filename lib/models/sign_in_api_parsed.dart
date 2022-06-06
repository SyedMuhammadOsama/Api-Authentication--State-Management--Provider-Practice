import 'package:flutter/cupertino.dart';

import 'user_data.dart';

class SignInApiParsed {
  String? message;
  int? statusCode;
  UserData? data;

  SignInApiParsed({this.message, this.statusCode, this.data});

  SignInApiParsed.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
