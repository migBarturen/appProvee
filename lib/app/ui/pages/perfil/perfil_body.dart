import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/perfil_controller.dart';
import '../../themes/helper_theme.dart';
import 'perfil_page_edit.dart';
import 'perfil_page_password.dart';

class PerfilBody extends StatelessWidget {
  const PerfilBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PerfilController>(builder: (_) {
      return SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(40),
                      child: Image.asset('assets/images/perfil.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: (_.globalController.user.value.estado == 'Activo')
                          ? const Color(0XFFABD9A3)
                          : const Color(0XFFE2E2E2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Estado de usuario:',
                          style: HelperTheme.bodyBlack,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        (_.globalController.user.value.estado == 'Activo')
                            ? const Icon(
                                Icons.check_circle,
                                size: 20,
                              )
                            : const Icon(
                                Icons.lock_clock,
                                size: 20,
                              ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          _.globalController.user.value.estado ?? '',
                          style: HelperTheme.bodyBlack,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Información personal',
                  style: HelperTheme.head,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: HelperTheme.gray100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _.globalController.user.value.docIdentidad ?? '',
                    style: HelperTheme.bodyBlack,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: HelperTheme.gray100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _.globalController.user.value.numDoc ?? '',
                    style: HelperTheme.bodyBlack,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: HelperTheme.gray100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _.globalController.user.value.nombres ?? '',
                    style: HelperTheme.bodyBlack,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: HelperTheme.gray100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _.globalController.user.value.apellidos ?? '',
                    style: HelperTheme.bodyBlack,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Información de contacto',
                  style: HelperTheme.head,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: HelperTheme.gray100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _.globalController.user.value.email ?? '',
                    style: HelperTheme.bodyBlack,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: HelperTheme.gray100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _.globalController.user.value.direccion ?? '',
                    style: HelperTheme.bodyBlack,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Información bancaria',
                  style: HelperTheme.head,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: HelperTheme.gray100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _.globalController.user.value.banco ?? '',
                    style: HelperTheme.bodyBlack,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Número de cuenta',
                      style: HelperTheme.body,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: HelperTheme.gray100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        _.globalController.user.value.numBanco ?? '',
                        style: HelperTheme.bodyBlack,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Número de CCI',
                      style: HelperTheme.body,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: HelperTheme.gray100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        _.globalController.user.value.numBancoCci ?? '',
                        style: HelperTheme.bodyBlack,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20.00,
                        ),
                        child: ElevatedButton(
                            style: HelperTheme().buttonStyle(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Editar perfil',
                                  style: HelperTheme.buttonText,
                                )
                              ],
                            ),
                            onPressed: () {
                              Get.to(
                                () => const PerfilPageEdit(),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(seconds: 1),
                              );
                            }),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const PerfilPagePassword(),
                            transition: Transition.rightToLeftWithFade,
                            duration: const Duration(seconds: 1),
                          );
                        },
                        child: const Text(
                          'Cambiar contraseña',
                          style: TextStyle(
                            color: HelperTheme.info,
                            fontFamily: HelperTheme.fontSource,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
