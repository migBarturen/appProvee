import 'package:get/get.dart';

import '../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    await 4.delay();
    Get.offNamed(Routes.LOGIN);
    super.onReady();
  }
}
