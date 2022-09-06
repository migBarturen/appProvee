import 'package:get/get.dart';

import '../data/models/login_model.dart';
import '../data/models/user_model.dart';

class GlobalController extends GetxController {
  RxBool isLoading = false.obs;
  var login = LoginModel().obs;
  var user = UserModel().obs;
  List documentList = [
    {
      "name": "DNI",
      "value": "DNI",
    },
    {
      "name": "RUC",
      "value": "RUC",
    },
    {
      "name": "Carnet extranjeria",
      "value": "Carnet extranjeria",
    },
  ];

  List bankList = [
    {
      "name": "BBVA",
      "value": "BBVA",
    },
    {
      "name": "BCP",
      "value": "BCP",
    },
    {
      "name": "Interbank",
      "value": "Interbank",
    },
    {
      "name": "Scotia Bank",
      "value": "Scotia Bank",
    },
  ];

  List cityList = [
    {"name": "Amazonas", "value": "1"},
    {"name": "Áncash", "value": "2"},
    {"name": "Apurímac", "value": "3"},
    {"name": "Arequipa", "value": "4"},
    {"name": "Ayacucho", "value": "5"},
    {"name": "Cajamarca", "value": "6"},
    {"name": "Callao", "value": "7"},
    {"name": "Cusco", "value": "8"},
    {"name": "Huancavelica", "value": "9"},
    {"name": "Huánuco", "value": "10"},
    {"name": "Ica", "value": "11"},
    {"name": "Junín", "value": "12"},
    {"name": "La Libertad", "value": "13"},
    {"name": "Lambayeque", "value": "14"},
    {"name": "Lima", "value": "15"},
    {"name": "Loreto", "value": "16"},
    {"name": "Madre de Dios", "value": "17"},
    {"name": "Moquegua", "value": "18"},
    {"name": "Pasco", "value": "19"},
    {"name": "Piura", "value": "20"},
    {"name": "Puno", "value": "21"},
    {"name": "San Martín", "value": "22"},
    {"name": "Tacna", "value": "23"},
    {"name": "Tumbes", "value": "24"},
  ];

  RxBool isAuthenticated = false.obs;
  bool get authenticated => isAuthenticated.value;
  void updateIsLoading(bool data) {
    isLoading(data);
  }

  void updateLogin(LoginModel data) {
    login(data);
  }

  void updateUser(UserModel data) {
    user(data);
  }

  void updateIsAutenticated(bool data) {
    isAuthenticated(data);
  }
}
