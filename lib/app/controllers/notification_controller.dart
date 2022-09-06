
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/notification_model.dart';
import '../data/repository/notification_repository.dart';
import '../ui/pages/notifications/widgets/notification_card.dart';
import '../ui/utils/snackbar_util.dart';
import 'global_controller.dart';

class NotificationController extends GetxController with GetTickerProviderStateMixin {
  NotificationRepository notificationRepository = NotificationRepository();
  final globalController = Get.find<GlobalController>();
  late AnimationController bodyAnimationController;
  late Animation<double> bodyAnimation;
  List<Widget> listViews = <Widget>[];
  RxInt status = 0.obs;

  @override
  void onInit() async {
    bodyAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    super.onInit();
  }

  @override
  void onReady() async{
    globalController.updateIsLoading(true);
    await notifications();
    changeStatus(1);
    globalController.updateIsLoading(false);
    bodyAnimationForward();
    super.onReady();
  }

  @override
  void onClose() {
    bodyAnimationController.dispose();
    super.onClose();
  }

  void bodyAnimationForward() {
    bodyAnimationController.forward();
  }

  void changeStatus(int data) {
    status.value = data;
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }
  Future<void> notifications() async {
    late String title;
    late String message;
    try {
      List<NotificationModel> data = await notificationRepository.getNotifications(globalController.login.value.token!);
      inspect(data);
      if(data.isNotEmpty) {
        listViews.clear();
        for(var i=0; i < data.length; i++) {
          listViews.add(NotificationCard(
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: bodyAnimationController,
                curve:
                  Interval((1 / data.length) * i, 1.0, curve: Curves.fastOutSlowIn))),
            animationController: bodyAnimationController,
            notification: data[i]
          ));
        }
      }
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

}
