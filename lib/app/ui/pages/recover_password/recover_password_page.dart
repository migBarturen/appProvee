import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/recover_password_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../themes/helper_theme.dart';
import 'recover_password_body.dart';

class RecoverPasswordPage extends StatelessWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecoverPasswordController>(
      init: RecoverPasswordController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: HelperTheme.black,
            appBar: AppBar(
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
                'Olvidé mi contraseña',
                style: HelperTheme.titleAppBar,
              ),
            ),
            body: Stack(
              children: <Widget>[
                const RecoverPasswordBody(),
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
