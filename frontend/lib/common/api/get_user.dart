import 'dart:convert';
import 'package:bdate/common/entity/entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetUser {
  static Future<User> getUser() async {
    BaseOptions bo = new BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    var dio = Dio(bo);
    final String id = "619ae978dd241249abd866fc";
    var response = await dio.get("http://localhost:8080/user/get/${id}");
    print(response.data);
    print(User.fromJson(response.data));
    return User.fromJson(response.data);
  }
}