import 'package:bdate/common/entity/entity.dart';
import 'package:dio/dio.dart';

class PutLike {
  static Future<User> putLike(User curUser, User user) async {
    BaseOptions bo = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    var dio = Dio(bo);
    Like like = Like(user: curUser.id, likedUser: user.id);
    var response = await dio.put("http://localhost:8080/user/likeduser", data:likeToJson(like));
    return User.fromJson(response.data);
  }
}