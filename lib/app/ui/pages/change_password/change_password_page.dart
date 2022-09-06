import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/change_password_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../global_widgets/navigation_drawer_widget.dart';
import '../../themes/helper_theme.dart';
import 'change_password_body.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      init: ChangePasswordController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: HelperTheme.white,
            appBar: AppBar(
              backgroundColor: HelperTheme.black,
              iconTheme: const IconThemeData(color: HelperTheme.white),
            ),
            drawer: const NavigationDrawerWidget(),
            body: Stack(
              children: <Widget>[
                const ChangePasswordBody(),
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
