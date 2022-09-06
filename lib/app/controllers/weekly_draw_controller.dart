import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/weekly_draw_model.dart';
import '../data/repository/weekly_draw_repository.dart';
import '../ui/pages/weekly_draw/widgets/weekly_draw_card.dart';
import '../ui/utils/snackbar_util.dart';
import 'global_controller.dart';

class WeeklyDrawController extends GetxController
    with GetTickerProviderStateMixin {
  final WeeklyDrawRepository weeklyDrawRepository = WeeklyDrawRepository();
  final globalController = Get.find<GlobalController>();

  late AnimationController bodyAnimationController;
  late Animation<double> bodyAnimation;
  List<Widget> listViews = <Widget>[];

  RxInt status = 0.obs;
  var totalWeeklyDraw = 0.obs;

  @override
  void onInit() async {
    bodyAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    super.onInit();
  }

  @override
  void onReady() async {
    globalController.updateIsLoading(true);
    await getWeeklyDraw();
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

  void updateTotalWeeklyDraw(int data) {
    totalWeeklyDraw(data);
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  Future<void> getWeeklyDraw() async {
    late String title;
    late String message;
    try {
      List<WeeklyDrawModel> data = await weeklyDrawRepository
          .getAllWeekleDraw(globalController.login.value.token!);
      int tickets = await weeklyDrawRepository.getWeekleDraw(
          globalController.login.value.token!, globalController.user.value.id!);
      if (data.isNotEmpty) {
        updateTotalWeeklyDraw(tickets);
        listViews.clear();
        for (var i = 0; i < data.length; i++) {
          listViews.add(WeeklyDrawCard(
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: bodyAnimationController,
                      curve: Interval((1 / data.length) * i, 1.0,
                          curve: Curves.fastOutSlowIn))),
              animationController: bodyAnimationController,
              data: data[i]));
        }
      }
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }
}
