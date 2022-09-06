import 'package:app_provee/app/ui/pages/register_user/widgets/register_user_form_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/register_user_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../themes/helper_theme.dart';

class RegisterUserPageEmail extends StatelessWidget {
  const RegisterUserPageEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterUserController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: HelperTheme.black,
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
                'Registro',
                style: HelperTheme.titleAppBar,
              ),
            ),
            body: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: const RegisterUserFormEmail(),
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
