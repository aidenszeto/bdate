import 'package:meta/meta.dart';
import 'dart:convert';

DisLike disLikeFromJson(String str) => DisLike.fromJson(json.decode(str));

String disLikeToJson(DisLike data) => json.encode(data.toJson());

class DisLike {
    DisLike({
        required this.user,
        required this.dislikedUser,
    });

    String user;
    String dislikedUser;

    factory DisLike.fromJson(Map<String, dynamic> json) => DisLike(
        user: json["user"],
        dislikedUser: json["dislikedUser"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "dislikedUser": dislikedUser,
    };
}
