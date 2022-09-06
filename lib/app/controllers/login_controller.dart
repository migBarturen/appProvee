import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/models/login_model.dart';
import '../data/models/user_model.dart';
import '../data/repository/user_repository.dart';
import '../ui/utils/snackbar_util.dart';
import 'global_controller.dart';
import 'package:basic_utils/basic_utils.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final globalController = Get.find<GlobalController>();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  RxBool isChecked = true.obs;
  GetStorage box = GetStorage();

  final repository = UserRepository();
  RxBool showPassword = true.obs;

  @override
  onInit() async {
    final username = box.read("username");
    final password = box.read("password");

    usernameController.text = username ?? '';
    passwordController.text = password ?? '';

    super.onInit();
  }

  @override
  void onReady() {
    globalController.updateIsAutenticated(false);
    super.onReady();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void changeIsChecked(bool data) {
    isChecked(data);
  }

  String? validatorUsername(String value) {
    if (value.isEmpty) {
      return 'Campo usuario es obligatorio.';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Campo usuario no es válido.';
    }
    return null;
  }

  String? validatorPassword(String value) {
    if (value.isEmpty) {
      return 'Campo contraseña es obligatorio.';
    }

    return null;
  }

  void updateShowPassword(bool data) {
    showPassword(data);
    update();
  }

  void forgot() {
    Get.toNamed('/recover_password');
  }

  void register() {
    Get.toNamed('/register_user');
  }

  Future<void> login(loginFormKey) async {
    bool validation = loginFormKey.currentState!.validate();
    late String title;
    late String message;
    usernameFocusNode.unfocus();
    passwordFocusNode.unfocus();
    if (validation) {
      globalController.updateIsLoading(true);
      try {
        LoginModel dataLogin = await repository.login(
            usernameController.text, passwordController.text);
        if (isChecked.value) {
          box.write("username", usernameController.text);
          box.write("password", passwordController.text);
        } else {
          box.remove('username');
          box.remove('password');
        }
        UserModel dataUser = await repository.getUser(dataLogin);
        title = "Notificación";
        message =
            'Bienvenido ${StringUtils.capitalize(dataUser.desNombres ?? '')}';
        SnackbarUtil().snackbarSuccess(title, message);
        globalController.updateIsAutenticated(true);
        globalController.updateLogin(dataLogin);
        globalController.updateUser(dataUser);

        Get.toNamed('/main');
      } catch (error) {
        title = "Error";
        message = error.toString();
        SnackbarUtil().snackbarError(title, message);
        globalController.updateIsAutenticated(true);
      }
      globalController.updateIsLoading(false);
    }
  }
}
