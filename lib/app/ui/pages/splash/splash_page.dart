import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/splash_controller.dart';
import '../../themes/helper_theme.dart';
import 'splash_body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return const SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: HelperTheme.black,
            body: SplashBody(),
          ),
        );
      },
    );
  }
}
