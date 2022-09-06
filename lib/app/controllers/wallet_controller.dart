import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/wallet_model.dart';
import '../data/repository/wallet_repository.dart';
import '../ui/pages/wallet/widgets/wallet_card.dart';
import '../ui/utils/snackbar_util.dart';
import 'global_controller.dart';

class WalletController extends GetxController with GetTickerProviderStateMixin {
  final WalletRepository walletRepository = WalletRepository();
  final globalController = Get.find<GlobalController>();

  late AnimationController bodyAnimationController;
  late Animation<double> bodyAnimation;
  List<Widget> listViews = <Widget>[];
  RxInt status = 0.obs;
  var wallet = WalletModel().obs;

  final amountController = TextEditingController();
  FocusNode amountFocusNode = FocusNode();

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
    await getWallet();
    changeStatus(1);
    globalController.updateIsLoading(false);
    bodyAnimationForward();
    super.onReady();
  }

  @override
  void onClose() {
    bodyAnimationController.dispose();
    amountController.dispose();
    super.onClose();
  }

  void bodyAnimationForward() {
    bodyAnimationController.forward();
  }

  void changeStatus(int data) {
    status.value = data;
  }

  String? validatorAmout(String value) {
    if (value.isEmpty) {
      return 'Campo monto a transferir es obligatorio.';
    }
    return null;
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  void updateWallet(WalletModel data) {
    wallet(data);
  }

  Future<void> getWallet() async {
    late String title;
    late String message;
    try {
      WalletModel data =
          await walletRepository.getWallet(globalController.login.value.token!);
      updateWallet(data);
      if (data.billetera!.isNotEmpty) {
        listViews.clear();
        for (var i = 0; i < data.billetera!.length; i++) {
          listViews.add(
            WalletCard(
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: bodyAnimationController,
                      curve: Interval((1 / data.billetera!.length) * i, 1.0,
                          curve: Curves.fastOutSlowIn))),
              animationController: bodyAnimationController,
              data: data.billetera![i],
            ),
          );
        }
      }
    } catch (error) {
      title = "Error";
      message = error.toString();
      SnackbarUtil().snackbarError(title, message);
    }
  }

  Future<void> setWallet(walletFormKey) async {
    bool validation = walletFormKey.currentState!.validate();
    late String title;
    late String message;
    if (validation) {
      globalController.isLoading(true);
      try {
        String token = globalController.login.value.token!;
        String id = globalController.login.value.id!;
        double amount = double.parse(amountController.text);
        String data = await walletRepository.setWallet(token, id, amount);
        Get.back();
        SnackbarUtil().snackbarSuccess('Confirmación', data);
        amountController.text = '';
      } catch (error) {
        title = "Error";
        message = error.toString();
        SnackbarUtil().snackbarError(title, message);
      }
      globalController.updateIsLoading(false);
    }
  }
}
