import 'package:meta/meta.dart';
import 'dart:convert';

Like likeFromJson(String str) => Like.fromJson(json.decode(str));

String likeToJson(Like data) => json.encode(data.toJson());

class Like {
    Like({
        required this.user,
        required this.likedUser,
    });

    String user;
    String likedUser;

    factory Like.fromJson(Map<String, dynamic> json) => Like(
        user: json["user"],
        likedUser: json["likedUser"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "likedUser": likedUser,
    };
}