import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/global_controller.dart';

class AuthGuardMiddleware extends GetMiddleware {
  final globalController = Get.find<GlobalController>();

  @override
  RouteSettings? redirect(String? route) {
    if (globalController.isAuthenticated.value == false) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
