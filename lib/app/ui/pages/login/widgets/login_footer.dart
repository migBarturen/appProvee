import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/login_controller.dart';
import '../../../themes/helper_theme.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: _.forgot,
              child: const Text(
                'Olvide mi contraseña',
                style: HelperTheme.bodyLink,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '¡Oh! ¿Todavía no eres parte de Provee?',
              style: HelperTheme.body,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _.register,
              child: const Text(
                'Registrate',
                style: HelperTheme.bodyLink,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: (MediaQuery.of(context).size.width / 2) - 50,
              height: 5,
              decoration: BoxDecoration(
                color: HelperTheme.gray,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      );
    });
  }
}
