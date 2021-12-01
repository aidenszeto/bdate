import 'package:bdate/common/entity/entity.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class ReviseUser {
  static updateUser(String id, UpdateUser user) async {
    BaseOptions bo = new BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    var dio = Dio(bo);
    var encodeUser = updateToJson(user);
    var url = "http://localhost:8080/user/update/" + id;
    Response response = await dio.put(url, data: encodeUser);
    int status = response.statusCode!;
    if (status >= 200 && status < 300) {
      return User.fromJson(response.data);
    } else {
      return null;
    }
  }
}
