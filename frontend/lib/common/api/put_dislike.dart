import 'package:bdate/common/entity/entity.dart';
import 'package:dio/dio.dart';

class PutDisLike {
  static Future<User> putDisLike(User curUser, User user) async {
    BaseOptions bo = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    var dio = Dio(bo);
    DisLike dislike = DisLike(user: curUser.id, dislikedUser: user.id);
    var response = await dio.put("http://localhost:8080/user/dislikeduser", data:disLikeToJson(dislike));
    return User.fromJson(response.data);
  }
}