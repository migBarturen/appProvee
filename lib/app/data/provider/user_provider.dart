import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/login_model.dart';
import '../models/user_model.dart';
import 'base_provider.dart';

class UserProvider {
  Future<LoginModel> login(String username, String password) async {
    LoginModel user = LoginModel();
    try {
      final response = await http
          .post(
        Uri.https(BaseProvider.BASE, '/api/usuario/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'email': username, 'clave': password}),
      )
          .timeout(const Duration(seconds: 60), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });
      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          user = LoginModel.fromJson(responseJson);
          break;
        case 401:
          throw (responseJson["msg"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }
    return user;
  }

  Future<int> recover(String email) async {
    late int data;
    try {
      final response = await http
          .post(
        Uri.https(BaseProvider.BASE, '/api/usuario/sendRecoverPass'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'email': email}),
      )
          .timeout(const Duration(seconds: 60), onTimeout: () {
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

  Future<String> sendVerificationCode(String email) async {
    late String data;
    try {
      final response = await http
          .post(
        Uri.https(BaseProvider.BASE, '/api/usuario/sendCodigoVerificacion'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'email': email}),
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

  Future<int> validateVerificationCode(String email, int code) async {
    late int data;
    try {
      final response = await http
          .post(
        Uri.https(BaseProvider.BASE, '/api/usuario/matchCodigoVerificacion'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'propietario': email,
          'codigo': code,
        }),
      )
          .timeout(const Duration(seconds: 60), onTimeout: () {
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

  Future<UserModel> getUser(LoginModel login) async {
    UserModel _user = UserModel();
    try {
      final response = await http.get(
        Uri.https(BaseProvider.BASE, '/api/usuario/${login.id}'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer ${login.token}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 60), onTimeout: () {
        throw ('Error en tiempo de espera, Por favor intentalo nuevamente!');
      });
      var responseJson = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          _user = UserModel.fromJson(responseJson);
          break;
        case 401:
          throw (responseJson["msg"]);
      }
    } on SocketException {
      throw ('Error de conexión con el servidor.');
    } on FormatException {
      throw ('Error en el formato del servicio.');
    }
    return _user;
  }

  Future<String> updatePassword(id, token, numeIden, password) async {
    late String data;
    try {
      final response = await http
          .put(
        Uri.https(BaseProvider.BASE, '/api/usuario/$id'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'num_doc': numeIden,
          'clave': password,
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

  Future<String> create(
    String typeDocument,
    String numberDocument,
    String name,
    String lastname,
    String address,
    String phone,
    String email,
    String password,
  ) async {
    late String data;
    try {
      final response = await http
          .post(
        Uri.https(BaseProvider.BASE, '/api/usuario'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'tipo_usuario': 'Afiliado',
          'doc_identidad': typeDocument,
          'num_doc': numberDocument,
          'des_nombres': "$name $lastname",
          'direccion': address,
          'num_tel': phone,
          'email': email,
          'clave': password,
          'term_cond': true,
          'estado': 'Activo',
          'ingresar_sorteo': '0',
          'nombres': name,
          'apellidos': lastname,
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

  Future<String> updatePerfil(
    id,
    token,
    numeIden,
    document,
    name,
    lastName,
    email,
    address,
    nameBank,
    numberBank,
    cciBank,
  ) async {
    late String data;
    try {
      final response = await http
          .put(
        Uri.https(BaseProvider.BASE, '/api/usuario/$id'),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'doc_identidad': document,
          'num_doc': numeIden,
          'des_nombres': '$name $lastName',
          'direccion': address,
          'email': email,
          'banco': nameBank,
          'num_banco': numberBank
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
