import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.password,
        required this.age,
        required this.gender,
        required this.ethnicity,
        required this.height,
        required this.year,
        required this.location,
        required this.major,
        required this.smoke,
        required this.drink,
        required this.photo,
        required this.instagram,
        required this.snapchat,
        required this.likedBy,
        required this.dislikedBy,
        required this.matches,
        required this.v,
        required this.verified,
    });

    String id;
    String firstName;
    String lastName;
    String email;
    String password;
    int age;
    String gender;
    String ethnicity;
    String height;
    String year;
    String location;
    String major;
    bool smoke;
    bool drink;
    String photo;
    String instagram;
    String snapchat;
    List<String> likedBy;
    List<dynamic> dislikedBy;
    List<String> matches;
    int v;
    bool verified;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        age: json["age"],
        gender: json["gender"],
        ethnicity: json["ethnicity"],
        height: json["height"],
        year: json["year"],
        location: json["location"],
        major: json["major"],
        smoke: json["smoke"],
        drink: json["drink"],
        photo: json["photo"],
        instagram: json["instagram"],
        snapchat: json["snapchat"],
        likedBy: List<String>.from(json["likedBy"].map((x) => x)),
        dislikedBy: List<dynamic>.from(json["dislikedBy"].map((x) => x)),
        matches: List<String>.from(json["matches"].map((x) => x)),
        v: json["__v"],
        verified: json["verified"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "age": age,
        "gender": gender,
        "ethnicity": ethnicity,
        "height": height,
        "year": year,
        "location": location,
        "major": major,
        "smoke": smoke,
        "drink": drink,
        "photo": photo,
        "instagram": instagram,
        "snapchat": snapchat,
        "likedBy": List<dynamic>.from(likedBy.map((x) => x)),
        "dislikedBy": List<dynamic>.from(dislikedBy.map((x) => x)),
        "matches": List<dynamic>.from(matches.map((x) => x)),
        "__v": v,
        "verified": verified,
    };
}
