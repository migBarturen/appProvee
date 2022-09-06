import 'dart:convert';

WeeklyDrawModel weeklyDrawModelFromJson(String str) => WeeklyDrawModel.fromJson(json.decode(str));

String weeklyDrawModelToJson(WeeklyDrawModel data) => json.encode(data.toJson());

class WeeklyDrawModel {
    WeeklyDrawModel({
        this.estado,
        this.estadoGanador,
        this.id,
        this.usuario,
        this.createdAt,
        this.updatedAt,
        this.monto,
    });

    bool? estado;
    bool? estadoGanador;
    String? id;
    Usuario? usuario;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? monto;

    factory WeeklyDrawModel.fromJson(Map<String, dynamic> json) => WeeklyDrawModel(
        estado: json["estado"],
        estadoGanador: json["estado_ganador"],
        id: json["_id"],
        usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        monto: json["monto"],
    );

    Map<String, dynamic> toJson() => {
        "estado": estado,
        "estado_ganador": estadoGanador,
        "_id": id,
        "usuario": usuario == null ? null : usuario!.toJson(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "monto": monto,
    };
}

class Usuario {
    Usuario({
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

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
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
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "banco": banco,
        "num_banco": numBanco,
        "num_banco_cci": numBancoCci,
    };
}
