import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/recover_password_controller.dart';
import 'widgets/recover_password_footer.dart';
import 'widgets/recover_password_form.dart';

class RecoverPasswordBody extends StatelessWidget {
  const RecoverPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecoverPasswordController>(builder: (_) {
      return Column(
        children: const [
          Expanded(child: RecoverPasswordForm()),
          RecoverPasswordFooter(),
        ],
      );
    });
  }
}
