import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/recover_password_controller.dart';
import '../../../themes/helper_theme.dart';

class RecoverPasswordForm extends StatelessWidget {
  const RecoverPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> recoverFormKey = GlobalKey<FormState>();
    return GetBuilder<RecoverPasswordController>(builder: (_) {
      return Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Form(
          key: recoverFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Restablece tu contraseña, indicanos cual es el correo electrónico con el que te registraste.',
                style: TextStyle(
                  color: HelperTheme.white,
                  fontFamily: HelperTheme.fontSource,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _.emailController,
                focusNode: _.emailFocusNode,
                autocorrect: false,
                decoration: HelperTheme().textInputDecoration(
                  'Correo electrónico',
                ),
                validator: (value) => _.validatorEmail(value!),
              ),
              Expanded(child: Container()),
              Container(
                decoration: HelperTheme().buttonBoxDecoration(),
                child: ElevatedButton(
                    style: HelperTheme().buttonStyle(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.login,
                          size: 24.0,
                          color: HelperTheme.white,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Restablecer contraseña',
                          style: HelperTheme.buttonText,
                        )
                      ],
                    ),
                    onPressed: () async {
                      await _.recover(recoverFormKey);
                    }),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    });
  }
}
