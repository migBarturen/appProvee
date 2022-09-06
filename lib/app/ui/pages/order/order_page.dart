import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/perfil_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../global_widgets/navigation_drawer_widget.dart';
import '../../themes/helper_theme.dart';
import 'order_body.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PerfilController>(
      init: PerfilController(),
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
                const OrderBody(),
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
