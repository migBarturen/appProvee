import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/wallet_controller.dart';
import '../../global_widgets/appbar_widget.dart';
import '../../global_widgets/loading_widget.dart';
import '../../global_widgets/navigation_drawer_widget.dart';
import '../../themes/helper_theme.dart';
import 'wallet_body.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      init: WalletController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: HelperTheme.black,
            appBar: AppBarWidget(title: 'Billetera virtual'),
            drawer: const NavigationDrawerWidget(),
            body: Stack(
              children: <Widget>[
                const WalletBody(),
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
