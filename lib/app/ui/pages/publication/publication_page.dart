import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/share_link_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../global_widgets/navigation_drawer_widget.dart';
import '../../themes/helper_theme.dart';
import 'publication_body.dart';

class PublicationPage extends StatelessWidget {
  const PublicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareLinkController>(
      init: ShareLinkController(),
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
                const PublicationBody(),
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
