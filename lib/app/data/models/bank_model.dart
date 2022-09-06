import 'dart:convert';

BankModel bankModelFromJson(String str) => BankModel.fromJson(json.decode(str));

String bankModelToJson(BankModel data) => json.encode(data.toJson());

class BankModel {
  BankModel({
    this.estado,
    this.id,
    this.desBanco,
    this.numCc,
    this.numCci,
  });

  bool? estado;
  String? id;
  String? desBanco;
  String? numCc;
  String? numCci;

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        estado: json["estado"],
        id: json["_id"],
        desBanco: json["des_banco"],
        numCc: json["num_cc"],
        numCci: json["num_cci"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "des_banco": desBanco,
        "num_cc": numCc,
        "num_cci": numCci,
      };
}
