import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.token,
    this.id,
  });

  String? token;
  String? id;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "_id": id,
      };
}
