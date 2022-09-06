import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/register_user_controller.dart';
import '../../../themes/helper_theme.dart';

class RegisterUserFooter extends StatelessWidget {
  const RegisterUserFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterUserController>(builder: (_) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: _.cancel,
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: HelperTheme.white,
                  fontFamily: HelperTheme.fontSource,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
