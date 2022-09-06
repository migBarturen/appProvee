import 'dart:convert';
import 'dart:io';
import 'package:app_provee/app/data/models/product_model.dart';
import 'package:http/http.dart' as http;

import 'base_provider.dart';

class BuyProvider {
  Future<String> setBuy(
      ProductModel product, int quantity, String usuario, String token) async {
    String data = '';
    try {
      final response = await http
          .post(
        Uri.https(BaseProvider.BASE, '/api/compra'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'idusuario': usuario,
          'cantidad': quantity,
          'estado': 'comprar',
          'articulo': product
        }),
      )
          .timeout(const Duration(seconds: 120), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });
      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          data = responseJson;
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

  Future<String> saveBuyBank(String id, String token, String bank,
      String dateOperation, String numberOperation, String image) async {
    String data = '';
    var body = '';
    if (image != '') {
      File photofile = File(image);
      final bytes = photofile.readAsBytesSync();
      final image64 = base64Encode(bytes);
      body = jsonEncode(<String, dynamic>{
        'tipo_pago': 'deposito',
        'estado': 'Pendiente de Pago',
        'des_banco': bank,
        'fecha_ope': dateOperation,
        'nume_ope': numberOperation,
        'foto_ope': image64
      });
    } else {
      body = jsonEncode(<String, dynamic>{
        'tipo_pago': 'deposito',
        'estado': 'Pendiente de Pago',
        'des_banco': bank,
        'fecha_ope': dateOperation,
        'nume_ope': numberOperation,
      });
    }
    try {
      final response = await http
          .put(
        Uri.https(BaseProvider.BASE, '/api/compra/$id'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      )
          .timeout(const Duration(seconds: 120), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });
      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          data = responseJson;
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

  Future<String> saveBuyApp(String id, String token, String apps,
      String dateOperation, String numberOperation, String image) async {
    File photofile = File(image);
    final bytes = photofile.readAsBytesSync();
    final image64 = base64Encode(bytes);
    String data = '';
    try {
      final response = await http
          .put(
        Uri.https(BaseProvider.BASE, '/api/compra/$id'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'tipo_pago': 'apps',
          'estado': 'Pendiente de Pago',
          'des_app': apps,
          'fecha_ope': dateOperation,
          'nume_ope': numberOperation,
          'foto_ope': image64
        }),
      )
          .timeout(const Duration(seconds: 120), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });
      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          data = responseJson;
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
