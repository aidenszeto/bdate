import 'dart:convert';
import 'package:bdate/common/entity/entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetUser {
  static Future<User> getUser(String id) async {
    BaseOptions bo = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    var dio = Dio(bo);
    var response = await dio.request("http://localhost:8080/user/get/${id}");
    return User.fromJson(response.data);
  }
}