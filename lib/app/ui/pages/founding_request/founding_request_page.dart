import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/founding_request_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../global_widgets/navigation_drawer_widget.dart';
import '../../themes/helper_theme.dart';
import 'founding_request_body.dart';

class FoundingRequestPage extends StatelessWidget {
  const FoundingRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoundingRequestController>(
      init: FoundingRequestController(),
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
                const FoundingRequestBody(),
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
