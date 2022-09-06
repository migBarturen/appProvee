import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/global_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/themes/app_theme.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  await GetStorage.init();
  Get.put(GlobalController(), permanent: true);
  HttpOverrides.global = PostHttpOverrides();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      theme: appThemeLigth,
      getPages: AppPages.pages,
    ),
  );
}
