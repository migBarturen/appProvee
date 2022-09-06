import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.fotos,
    this.opinion,
    this.estadoArticulo,
    this.id,
    this.tipoArticulo,
    this.categoria,
    this.titulo,
    this.descripcion,
    this.precio,
    this.cantidad,
    this.ubicacion,
    this.estado,
    this.usuario,
    this.createdAt,
    this.updatedAt,
  });

  List<Foto>? fotos;
  List<Opinion>? opinion;
  String? estadoArticulo;
  String? id;
  String? tipoArticulo;
  String? categoria;
  String? titulo;
  String? descripcion;
  int? precio;
  int? cantidad;
  String? ubicacion;
  bool? estado;
  Usuario? usuario;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        fotos: json["fotos"] == null
            ? null
            : List<Foto>.from(json["fotos"].map((x) => Foto.fromJson(x))),
        opinion: json["opinion"] == null
            ? null
            : List<Opinion>.from(
                json["opinion"].map((x) => Opinion.fromJson(x))),
        estadoArticulo: json["estado_articulo"],
        id: json["_id"],
        tipoArticulo: json["tipo_articulo"],
        categoria: json["categoria"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        cantidad: json["cantidad"],
        ubicacion: json["ubicacion"],
        estado: json["estado"],
        usuario:
            json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "estado_articulo": estadoArticulo,
        "_id": id,
        "tipo_articulo": tipoArticulo,
        "categoria": categoria,
        "titulo": titulo,
        "descripcion": descripcion,
        "precio": precio,
        "cantidad": cantidad,
        "ubicacion": ubicacion,
        "estado": estado,
        "usuario": usuario == null ? null : usuario!.toJson(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "opinion": opinion == null
            ? null
            : List<dynamic>.from(opinion!.map((x) => x.toJson())),
        "fotos": fotos == null
            ? null
            : List<dynamic>.from(fotos!.map((x) => x.toJson())),
      };
}

class Foto {
  Foto({
    this.img,
    this.estado,
  });

  String? img;
  bool? estado;

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        img: json["img"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "estado": estado,
      };
}

class Opinion {
  Opinion({
    this.numOpinion,
    this.desOpinion,
    this.fecha,
    this.usuario,
  });

  int? numOpinion;
  String? desOpinion;
  DateTime? fecha;
  String? usuario;

  factory Opinion.fromJson(Map<String, dynamic> json) => Opinion(
        numOpinion: json["num_opinion"],
        desOpinion: json["des_opinion"],
        fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
        usuario: json["usuario"],
      );

  Map<String, dynamic> toJson() => {
        "num_opinion": numOpinion,
        "des_opinion": desOpinion,
        "fecha": fecha == null ? null : fecha!.toIso8601String(),
        "usuario": usuario,
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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
