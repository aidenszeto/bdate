import 'package:meta/meta.dart';
import 'dart:convert';

Filter filterFromJson(String str) => Filter.fromJson(json.decode(str));

String filterToJson(Filter data) => json.encode(data.toJson());

class Filter {
    Filter({
        required this.whoToDate,
        required this.year,
        required this.location,
        required this.drink,
        required this.smoke,
        required this.userId,
    });

    List<dynamic> whoToDate;
    List<dynamic> year;
    List<dynamic> location;
    bool? drink;
    bool? smoke;
    String userId;

    factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        whoToDate: List<dynamic>.from(json["whoToDate"].map((x) => x)),
        year: List<dynamic>.from(json["year"].map((x) => x)),
        location: List<dynamic>.from(json["location"].map((x) => x)),
        drink: json["drink"],
        smoke: json["smoke"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "whoToDate": List<dynamic>.from(whoToDate.map((x) => x)),
        "year": List<dynamic>.from(year.map((x) => x)),
        "location": List<dynamic>.from(location.map((x) => x)),
        "drink": drink,
        "smoke": smoke,
        "userId": userId,
    };
}
