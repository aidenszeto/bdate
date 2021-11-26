// To parse this JSON data, do
//
//     final filteredUsers = filteredUsersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FilteredUsers> filteredUsersFromJson(String str) => List<FilteredUsers>.from(json.decode(str).map((x) => FilteredUsers.fromJson(x)));

String filteredUsersToJson(List<FilteredUsers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilteredUsers {
    FilteredUsers({
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
        required this.verified,
        required this.v,
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
    dynamic instagram;
    dynamic snapchat;
    List<String> likedBy;
    List<String> dislikedBy;
    List<String> matches;
    bool verified;
    int v;

    factory FilteredUsers.fromJson(Map<String, dynamic> json) => FilteredUsers(
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
        dislikedBy: List<String>.from(json["dislikedBy"].map((x) => x)),
        matches: List<String>.from(json["matches"].map((x) => x)),
        verified: json["verified"],
        v: json["__v"],
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
        "verified": verified,
        "__v": v,
    };
}
