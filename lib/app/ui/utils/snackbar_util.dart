import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtil {
  void snackbarError(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(
        Icons.error_outline_rounded,
        color: Colors.white,
        size: 40,
      ),
      colorText: Colors.white,
      backgroundColor: Colors.red[400],
      borderColor: Colors.red[900],
      borderWidth: 1,
      borderRadius: 10,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.endToStart,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  void snackbarSuccess(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(
        Icons.check_circle_outline,
        color: Colors.white,
        size: 40,
      ),
      colorText: Colors.white,
      backgroundColor: Colors.green[400],
      borderColor: Colors.green[900],
      borderWidth: 1,
      borderRadius: 10,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
    );
  }
}
