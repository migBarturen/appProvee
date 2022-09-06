import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/perfil_controller.dart';
import '../../global_widgets/appbar_widget.dart';
import '../../global_widgets/loading_widget.dart';
import '../../global_widgets/navigation_drawer_widget.dart';
import '../../themes/helper_theme.dart';
import 'perfil_body.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PerfilController>(
      init: PerfilController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: HelperTheme.black,
            appBar: AppBarWidget(title: 'Perfil'),
            drawer: const NavigationDrawerWidget(),
            body: Stack(
              children: <Widget>[
                const PerfilBody(),
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
