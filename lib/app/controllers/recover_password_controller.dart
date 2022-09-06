import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/user_repository.dart';
import '../ui/utils/snackbar_util.dart';
import 'global_controller.dart';

class RecoverPasswordController extends GetxController {
  final emailController = TextEditingController();
  final globalController = Get.find<GlobalController>();

  FocusNode emailFocusNode = FocusNode();
  final repository = UserRepository();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  String? validatorEmail(String value) {
    if (value.isEmpty) {
      return 'Campo correo electrónico es obligatorio.';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Campo correo electrónico no es válido.';
    }
    return null;
  }

  void cancel() {
    Get.back();
  }

  Future<void> recover(recoverFormKey) async {
    bool validation = recoverFormKey.currentState!.validate();
    late String title;
    late String message;
    emailFocusNode.unfocus();
    if (validation) {
      globalController.updateIsLoading(true);
      try {
        int data = await repository.recover(emailController.text);
        if (data == 1) {
          title = "Notificación";
          message =
              'Se envio un correo electrónico con su contraseña a  ${emailController.text}';
          SnackbarUtil().snackbarSuccess(title, message);
          Get.toNamed('/login');
        } else {
          title = "Error";
          message = 'Correo electrónico  ${emailController.text} no existe.';
          SnackbarUtil().snackbarError(title, message);
        }
      } catch (error) {
        title = "Error";
        message = error.toString();
        SnackbarUtil().snackbarError(title, message);
      }
      globalController.updateIsLoading(false);
    }
  }
}
