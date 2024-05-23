// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

import 'package:telechat/core/services/api_services.dart';
import 'package:telechat/utils/config.dart';

List<UsersModel> usersModelFromJson(String str) => List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String usersModelToJson(List<UsersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? profilePicture;
  String? dateOfBirth;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  UsersModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.profilePicture,
    this.dateOfBirth,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    profilePicture: AppConfig.baseUrl + json["profile_picture"],
    dateOfBirth: json["date_of_birth"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "profile_picture": profilePicture,
    "date_of_birth": dateOfBirth,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
