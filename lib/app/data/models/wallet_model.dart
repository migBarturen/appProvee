import 'dart:convert';

WalletModel walletModelFromJson(String str) =>
    WalletModel.fromJson(json.decode(str));

String walletModelToJson(WalletModel data) => json.encode(data.toJson());

class WalletModel {
  WalletModel({
    this.billetera,
    this.total,
  });

  List<Billetera>? billetera;
  String? total;

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        billetera: json["billetera"] == null
            ? null
            : List<Billetera>.from(
                json["billetera"].map((x) => Billetera.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "billetera": billetera == null
            ? null
            : List<dynamic>.from(billetera!.map((x) => x.toJson())),
        "total": total,
      };
}

class Billetera {
  Billetera({
    this.id,
    this.idusuario,
    this.tipoMovimiento,
    this.estadoMovimiento,
    this.descripcion,
    this.monto,
    this.estado,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? idusuario;
  String? tipoMovimiento;
  String? estadoMovimiento;
  String? descripcion;
  double? monto;
  bool? estado;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Billetera.fromJson(Map<String, dynamic> json) => Billetera(
        id: json["_id"],
        idusuario: json["idusuario"],
        tipoMovimiento: json["tipo_movimiento"],
        estadoMovimiento: json["estado_movimiento"],
        descripcion: json["descripcion"],
        monto: json["monto"] == null ? null : json["monto"]!.toDouble(),
        estado: json["estado"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "idusuario": idusuario,
        "tipo_movimiento": tipoMovimiento,
        "estado_movimiento": estadoMovimiento,
        "descripcion": descripcion,
        "monto": monto,
        "estado": estado,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
