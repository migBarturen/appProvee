import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/wallet_model.dart';
import 'base_provider.dart';

class WalletProvider {
  Future<WalletModel> getWallet(String token) async {
    late WalletModel data;
    try {
      final response = await http.get(
        Uri.https(BaseProvider.BASE, '/api/billetera'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 60), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });
      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          data = WalletModel.fromJson(responseJson);
          break;
        case 401:
          throw (responseJson["msg"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }
    return data;
  }

  Future<String> setWallet(String token, String id, double amount) async {
    late String data = '';
    try {
      final response = await http
          .post(
        Uri.https(BaseProvider.BASE, '/api/billetera'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'idusuario': id,
          'descripcion': 'Retiro a cuenta',
          'tipo_movimiento': 'Salida',
          'estado_movimiento': 'Pendiente',
          'monto': amount,
        }),
      )
          .timeout(const Duration(seconds: 60), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });
      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          data = responseJson["status"];
          break;
        case 401:
          throw (responseJson["msg"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }
    return data;
  }
}
