import 'package:bdate/common/entity/entity.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class PostUser {
  static createAccount(CreateUser user) async {
    BaseOptions bo = new BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    var dio = Dio(bo);
    var encodeUser = userToJson(user);
    Response response =
        await dio.post("http://localhost:8080/user/signup", data: encodeUser);
    int status = response.statusCode!;
    if (status >= 200 && status < 300) {
      return User.fromJson(response.data);
    } else {
      return null;
    }
  }

  static login(LoginUser user) async {
    BaseOptions bo = new BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    var dio = Dio(bo);
    var encodeUser = loginToJson(user);
    Response response =
        await dio.post("http://localhost:8080/user/login", data: encodeUser);
    int status = response.statusCode!;
    if (status >= 200 && status < 300) {
      return User.fromJson(response.data);
    } else {
      return null;
    }
  }
}
