import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/notification_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../themes/helper_theme.dart';
import 'notification_body.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: HelperTheme.black,
            appBar: AppBar(
              centerTitle: false,
              elevation: 0,
              backgroundColor: HelperTheme.black,
              iconTheme: const IconThemeData(color: HelperTheme.white),
              title: const Text('Notificaciones', style: HelperTheme.titleAppBar, textAlign: TextAlign.left,),
            ),
            body: Stack(
              children: <Widget>[
                const NotificationBody(),
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
