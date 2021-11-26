import 'dart:convert';

import 'package:bdate/common/entity/entity.dart';
import 'package:dio/dio.dart';

class GetFilter {
  static Future<List<User>> getFilter(Filter filter) async {
    BaseOptions bo = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    var dio = Dio(bo);
    var response = await dio.post("http://localhost:8080/user/filter", data: filterToJson(filter));
    List<User> result = [];
    response.data.forEach((u) {
      result.add(User.fromJson(u));
    });
    return result;
  }

}