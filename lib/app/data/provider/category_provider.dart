import 'dart:convert';
import 'dart:io';

import '../models/category_model.dart';
import 'package:http/http.dart' as http;

import 'base_provider.dart';

class CategoryProvider {
  Future<List<CategoryModel>> getCategories(String token) async {
    List<CategoryModel> data = [];
    try {
      final response = await http.get(
        Uri.https(
            BaseProvider.BASE, '/api/categoria', {'tipo_articulo': 'Servicio'}),
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
          data = list.map((model) => CategoryModel.fromJson(model)).toList();
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
