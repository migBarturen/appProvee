import 'dart:convert';
import 'dart:io';

import '../models/bank_model.dart';
import 'package:http/http.dart' as http;

import 'base_provider.dart';

class BankProvider {
  Future<List<BankModel>> getBanks(String token) async {
    List<BankModel> data = [];
    try {
      final response = await http.get(
        Uri.https(BaseProvider.BASE, '/api/banco'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 120), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });
      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          Iterable list = responseJson;
          data = list.map((model) => BankModel.fromJson(model)).toList();
          break;
        case 404:
          throw (responseJson);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }
    return data;
  }
}
