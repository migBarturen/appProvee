import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.ingresarSorteo,
    this.id,
    this.tipoUsuario,
    this.docIdentidad,
    this.numDoc,
    this.desNombres,
    this.direccion,
    this.numTel,
    this.email,
    this.clave,
    this.termCond,
    this.estado,
    this.nombres,
    this.apellidos,
    this.createdAt,
    this.updatedAt,
    this.banco,
    this.numBanco,
    this.numBancoCci,
  });

  String? ingresarSorteo;
  String? id;
  String? tipoUsuario;
  String? docIdentidad;
  String? numDoc;
  String? desNombres;
  String? direccion;
  String? numTel;
  String? email;
  String? clave;
  bool? termCond;
  String? estado;
  String? nombres;
  String? apellidos;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? banco;
  String? numBanco;
  String? numBancoCci;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        ingresarSorteo: json["ingresar_sorteo"],
        id: json["_id"],
        tipoUsuario: json["tipo_usuario"],
        docIdentidad: json["doc_identidad"],
        numDoc: json["num_doc"],
        desNombres: json["des_nombres"],
        direccion: json["direccion"],
        numTel: json["num_tel"],
        email: json["email"],
        clave: json["clave"],
        termCond: json["term_cond"],
        estado: json["estado"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        banco: json["banco"],
        numBanco: json["num_banco"],
        numBancoCci: json["num_banco_cci"],
      );

  Map<String, dynamic> toJson() => {
        "ingresar_sorteo": ingresarSorteo,
        "_id": id,
        "tipo_usuario": tipoUsuario,
        "doc_identidad": docIdentidad,
        "num_doc": numDoc,
        "des_nombres": desNombres,
        "direccion": direccion,
        "num_tel": numTel,
        "email": email,
        "clave": clave,
        "term_cond": termCond,
        "estado": estado,
        "nombres": nombres,
        "apellidos": apellidos,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "banco": banco,
        "num_banco": numBanco,
        "num_banco_cci": numBancoCci,
      };
}
