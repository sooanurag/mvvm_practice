import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String token;

  UserModel({
    required this.token,
    this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
      };
}
