import 'package:app_provee/app/ui/pages/perfil/perfil_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/perfil_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../themes/helper_theme.dart';

class PerfilPagePassword extends StatelessWidget {
  const PerfilPagePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
    return GetBuilder<PerfilController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: HelperTheme.black,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: false,
              elevation: 0,
              backgroundColor: HelperTheme.black,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: HelperTheme.white,
                ),
                onPressed: () => Get.back(),
              ),
              title: const Text(
                'Cambiar contraseña',
                style: HelperTheme.titleAppBar,
              ),
            ),
            body: Stack(
              children: <Widget>[
                Form(
                  key: passwordFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          'Contraseña actual',
                          style: HelperTheme.head,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: TextFormField(
                          controller: _.passwordController,
                          focusNode: _.passwordFocusNode,
                          autocorrect: false,
                          obscureText: true,
                          decoration: HelperTheme().textInputDecoration(
                            'Contraseña',
                          ),
                          validator: (value) => _.validatorPassword(value!),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: TextFormField(
                          controller: _.passwordConfirmController,
                          focusNode: _.passwordConfirmFocusNode,
                          autocorrect: false,
                          obscureText: true,
                          decoration: HelperTheme().textInputDecoration(
                            'Confirmar contraseña',
                          ),
                          validator: (value) =>
                              _.validatorPasswordConfirm(value!),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          'Nueva contraseña',
                          style: HelperTheme.head,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: TextFormField(
                          controller: _.passwordNewController,
                          focusNode: _.passwordNewFocusNode,
                          autocorrect: false,
                          obscureText: true,
                          decoration: HelperTheme().textInputDecoration(
                            'Crear nueva contraseña',
                          ),
                          validator: (value) => _.validatorPasswordNew(value!),
                        ),
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 20),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Guardar cambios',
                                          style: HelperTheme.buttonText,
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      _.password(passwordFormKey);
                                    }),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.dialog(
                                    AlertDialog(
                                      scrollable: true,
                                      titlePadding: EdgeInsets.zero,
                                      contentPadding: EdgeInsets.zero,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      title: const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Center(
                                          child: Text(
                                            '🤔',
                                            style: TextStyle(fontSize: 50),
                                          ),
                                        ),
                                      ),
                                      content: Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 20.0,
                                              right: 20.0,
                                              bottom: 15.0,
                                            ),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  '¿Salir sin guardar?',
                                                  style: HelperTheme.headBlack,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  'los cambios no se guardarán.',
                                                  style: HelperTheme.bodyBlack,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                ElevatedButton(
                                                  style: HelperTheme()
                                                      .buttonStyleMd(
                                                          HelperTheme.danger),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text(
                                                        'Salir sin guardar',
                                                        style: HelperTheme
                                                            .buttonText,
                                                      )
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    _.cleanPassword();
                                                    Get.to(() => const PerfilPage());
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _.cleanPassword();
                                                    Get.back();
                                                  },
                                                  child: const Text(
                                                    'Cancelar',
                                                    style: TextStyle(
                                                      color: HelperTheme.info,
                                                      fontFamily: HelperTheme
                                                          .fontSource,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    barrierDismissible: false,
                                  );
                                },
                                child: const Text(
                                  'Cancelar',
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
                Obx(() {
                  if (_.globalController.isLoading.value) {
                    return const LoadingWidget();
                  }
                  return const SizedBox();
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
