import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/login_model.dart';
import '../data/models/user_model.dart';
import '../data/repository/user_repository.dart';
import '../ui/utils/snackbar_util.dart';
import 'global_controller.dart';

class PerfilController extends GetxController {
  final userRepository = UserRepository();
  final globalController = Get.find<GlobalController>();
  final numberController = TextEditingController();
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();

  final emailController = TextEditingController();
  final addressController = TextEditingController();

  final numberBankController = TextEditingController();
  final cciBankController = TextEditingController();

  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final passwordNewController = TextEditingController();

  FocusNode numberFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode lastnameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode numberBankFocusNode = FocusNode();
  FocusNode cciBankFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode passwordConfirmFocusNode = FocusNode();
  FocusNode passwordNewFocusNode = FocusNode();

  String? validatorNumber(String value) {
    if (value.isEmpty) {
      return 'Campo nro documento es obligatorio.';
    }

    return null;
  }

  String? validatorName(String value) {
    if (value.isEmpty) {
      return 'Campo nombres es obligatorio.';
    }

    return null;
  }

  String? validatorLastName(String value) {
    if (value.isEmpty) {
      return 'Campo apellido(s) es obligatorio.';
    }

    return null;
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

  String? validatorAddress(String value) {
    if (value.isEmpty) {
      return 'Campo dirección es obligatorio.';
    }

    return null;
  }

  String? validatorNumberBank(String value) {
    if (value.isEmpty) {
      return 'Campo nro de cuenta es obligatorio.';
    }
    return null;
  }

  String? validatorCciBank(String value) {
    if (value.isEmpty) {
      return 'Campo cci es obligatorio.';
    }
    return null;
  }

  String? validatorPassword(String value) {
    if (value.isEmpty) {
      return 'Campo contraseña actual obligatoria.';
    }
    if (value != globalController.user.value.clave) {
      return 'Campo contraseña actual es incorrecta.';
    }
    return null;
  }

  String? validatorPasswordConfirm(String value) {
    if (value.isEmpty) {
      return 'Campo confirmar contraseña obligatoria.';
    }
    if (value != passwordController.text) {
      return 'Campo confirmar contraseña diferente a contraseña actual obligatoria.';
    }
    return null;
  }

  String? validatorPasswordNew(String value) {
    if (value.isEmpty) {
      return 'Campo crear contraseña obligatoria.';
    }
    return null;
  }

  RxString typeDocument = ''.obs;
  RxString bank = ''.obs;

  @override
  void onInit() {
    typeDocument.value = globalController.user.value.docIdentidad ?? '';
    numberController.text = globalController.user.value.numDoc ?? '';
    nameController.text = globalController.user.value.nombres ?? '';
    lastnameController.text = globalController.user.value.apellidos ?? '';
    emailController.text = globalController.user.value.email ?? '';
    addressController.text = globalController.user.value.direccion ?? '';
    bank.value = globalController.user.value.banco ?? '';
    numberBankController.text = globalController.user.value.numBanco ?? '';
    cciBankController.text = globalController.user.value.numBancoCci ?? '';
    super.onInit();
  }

  @override
  void onClose() {
    numberController.dispose();
    nameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    addressController.dispose();
    numberBankController.dispose();
    cciBankController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    passwordNewController.dispose();
    super.onClose();
  }

  void cleanPassword() {
    passwordController.text = '';
    passwordConfirmController.text = '';
    passwordNewController.text = '';
  }

  void updateBank(String data) {
    bank.value = data;
  }

  void updateTypeDocumet(String data) {
    typeDocument.value = data;
  }

  void password(passwordFormKey) async {
    bool validation = passwordFormKey.currentState!.validate();
    late String title;
    late String message;
    passwordFocusNode.unfocus();
    passwordConfirmFocusNode.unfocus();
    passwordNewFocusNode.unfocus();
    if (validation) {
      globalController.isLoading(true);
      try {
        String id = globalController.login.value.id!;
        String token = globalController.login.value.token!;
        String numeIden = globalController.user.value.numDoc!;
        String password = passwordNewController.text;
        String data =
            await userRepository.updatePassword(id, token, numeIden, password);
        Get.back();
        SnackbarUtil().snackbarSuccess('Confirmación', data);
      } catch (e) {
        title = "Error";
        message = e.toString();
        SnackbarUtil().snackbarError(title, message);
      }
      globalController.isLoading(false);
    }
  }

  void edit(perfilFormKey) async {
    bool validation = perfilFormKey.currentState!.validate();
    late String title;
    late String message;
    numberFocusNode.unfocus();
    nameFocusNode.unfocus();
    lastnameFocusNode.unfocus();
    emailFocusNode.unfocus();
    addressFocusNode.unfocus();
    numberBankFocusNode.unfocus();
    cciBankFocusNode.unfocus();

    if (validation) {
      globalController.isLoading(true);
      try {
        String id = globalController.login.value.id!;
        String token = globalController.login.value.token!;

        String document = typeDocument.value;
        String numeIden = numberController.text;
        String name = nameController.text;
        String lastName = lastnameController.text;

        String email = emailController.text;
        String address = addressController.text;

        String nameBank = bank.value;
        String numberBank = numberBankController.text;
        String cciBank = cciBankController.text;

        String data = await userRepository.updatePerfil(
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
        );
        LoginModel dataLogin = globalController.login.value;
        UserModel dataUser = await userRepository.getUser(dataLogin);
        globalController.updateUser(dataUser);
        Get.back();
        SnackbarUtil().snackbarSuccess('Confirmación', data);
      } catch (e) {
        title = "Error";
        message = e.toString();
        SnackbarUtil().snackbarError(title, message);
      }
      globalController.isLoading(false);
    }
  }
}
