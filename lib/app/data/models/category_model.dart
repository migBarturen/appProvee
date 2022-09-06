import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.estado,
    this.id,
    this.desCategoria,
    this.tipoArticulo,
    this.createdAt,
    this.updatedAt,
  });

  bool? estado;
  String? id;
  String? desCategoria;
  String? tipoArticulo;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        estado: json["estado"],
        id: json["_id"],
        desCategoria: json["des_categoria"],
        tipoArticulo: json["tipo_articulo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "des_categoria": desCategoria,
        "tipo_articulo": tipoArticulo,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
