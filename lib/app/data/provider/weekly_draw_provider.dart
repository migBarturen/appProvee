import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/weekly_draw_model.dart';
import 'base_provider.dart';

class WeeklyDrawProvider {
  Future<List<WeeklyDrawModel>> getAllWeeklyDraw(String token) async {
    List<WeeklyDrawModel> data = [];
    try {
      final response = await http.get(
        Uri.https(BaseProvider.BASE, '/api/sorteo'),
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
          Iterable list = responseJson;
          data = list.map((model) => WeeklyDrawModel.fromJson(model)).toList();
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

  Future<int> getWeeklyDraw(String token, String id) async {
    int data = 0;
    try {
      final response = await http.get(
        Uri.https(BaseProvider.BASE, '/api/sorteo/getSorteoId/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 60), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });
      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          data = responseJson;
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
