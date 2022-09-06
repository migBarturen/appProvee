import 'package:app_provee/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../controllers/splash_controller.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInUp(
              child: const Text(
                '💰',
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInUp(
              child: const SizedBox(
                width: 250,
                child: Text('Gana dinero y compra productos en un mismo lugar.',
                    style: HelperTheme.bodyLinkLg, textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      );
    });
  }
}
