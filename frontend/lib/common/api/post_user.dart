import 'package:bdate/common/entity/entity.dart';
import 'package:dio/dio.dart';

class PostUser {
  static postUser(CreateUser user) async {
    BaseOptions bo = new BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    var dio = Dio(bo);
    Response response =
        await dio.post("http://localhost:8080/user/signup", data: user);
    return response.statusCode;
  }
}
