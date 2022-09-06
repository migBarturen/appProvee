import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/register_user_controller.dart';
import '../../../themes/helper_theme.dart';

class RegisterUserFormEmail extends StatelessWidget {
  const RegisterUserFormEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
    return GetBuilder<RegisterUserController>(builder: (_) {
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: emailFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Verificación',
                          style: HelperTheme.head,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Necesitamos verificar tu correo electrónico, por favor ingresa el código que te enviamos.',
                          style: HelperTheme.body,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HelperTheme.info,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HelperTheme.info,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HelperTheme.info,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HelperTheme.ultraBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _.codeController,
                          focusNode: _.codeFocusNode,
                          autocorrect: false,
                          decoration: HelperTheme().textInputDecoration(
                            'Código de verificacón',
                          ),
                          validator: (value) => _.validatorNumber(value!),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Por favor ingresa el código que se te envio a ${_.emailController.text}',
                          style: const TextStyle(
                            fontFamily: HelperTheme.fontSource,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: HelperTheme.danger,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _.passwordController,
                          focusNode: _.passwordFocusNode,
                          autocorrect: false,
                          obscureText: _.showPassword.value,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            fillColor: HelperTheme.white,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Obx(() {
                                if (_.showPassword.value) {
                                  return const Icon(Icons.visibility);
                                }
                                return const Icon(Icons.visibility_off);
                              }),
                              onPressed: () {
                                _.updateShowPassword(!_.showPassword.value);
                              },
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: HelperTheme.danger,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: HelperTheme.danger,
                                )),
                          ),
                          validator: (value) => _.validatorPassword(value!),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _.passwordConfirmController,
                          focusNode: _.passwordConfirmFocusNode,
                          autocorrect: false,
                          obscureText: _.showPasswordConfirm.value,
                          decoration: InputDecoration(
                            hintText: 'Confirmar contraseña',
                            fillColor: HelperTheme.white,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: Obx(() {
                                if (_.showPasswordConfirm.value) {
                                  return const Icon(Icons.visibility);
                                }
                                return const Icon(Icons.visibility_off);
                              }),
                              onPressed: () {
                                _.updateShowPasswordConfirm(
                                    !_.showPasswordConfirm.value);
                              },
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: HelperTheme.danger,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: HelperTheme.danger,
                                )),
                          ),
                          validator: (value) =>
                              _.validatorPasswordConfirm(value!),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HelperTheme.secondary,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.navigate_before,
                            color: HelperTheme.white,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HelperTheme.success,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.navigate_next,
                            color: HelperTheme.white,
                          ),
                          onPressed: () {
                            _.email(emailFormKey);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
