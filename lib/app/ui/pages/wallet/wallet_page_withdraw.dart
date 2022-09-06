import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/wallet_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../themes/helper_theme.dart';

class WalletPageWithdraw extends StatelessWidget {
  const WalletPageWithdraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> walletFormKey = GlobalKey<FormState>();
    return GetBuilder<WalletController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: HelperTheme.black,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: false,
              elevation: 0,
              backgroundColor: HelperTheme.black,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: HelperTheme.white,
                ),
                onPressed: () => Get.back(),
              ),
              title: const Text(
                'Billetera virtual',
                style: HelperTheme.titleAppBar,
              ),
            ),
            body: Stack(
              children: <Widget>[
                Form(
                  key: walletFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            top: 10,
                          ),
                          decoration: BoxDecoration(
                            color: HelperTheme.gray100,
                            border: Border.all(
                              color: HelperTheme.gray300,
                              width: 1.00,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: HelperTheme.secondary,
                                spreadRadius: 2.00,
                                blurRadius: 2.00,
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 10.00,
                                  top: 15.00,
                                  right: 10.00,
                                ),
                                child: Text(
                                  "Saldo disponible",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: HelperTheme.bodyGray,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.00,
                                  top: 10.00,
                                  right: 10.00,
                                  bottom: 10,
                                ),
                                child: Obx(
                                  () => Text(
                                    "S/ ${_.wallet.value.total ?? '0.00'}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: HelperTheme.headBlack,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.00,
                            top: 20.00,
                            right: 20.00,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: HelperTheme.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.00,
                                    right: 10.00,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: 19,
                                        height: 21,
                                        child: Image.asset(
                                          'assets/images/VectorBanco.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10.00,
                                            bottom: 10.00,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Banco destino",
                                                style: HelperTheme.bodyBlack,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Obx(
                                                () => Text(
                                                  _.globalController.user.value
                                                          .banco ??
                                                      '',
                                                  style:
                                                      HelperTheme.bodyBlackBold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.00,
                            top: 10.00,
                            right: 20.00,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: HelperTheme.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.00,
                                    right: 10.00,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: 19,
                                        height: 21,
                                        child: Image.asset(
                                          'assets/images/VectorCuenta.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10.00,
                                            bottom: 10.00,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Cuenta de destino",
                                                style: HelperTheme.bodyBlack,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Obx(
                                                () => Text(
                                                  _.globalController.user.value
                                                          .numBanco ??
                                                      '',
                                                  style:
                                                      HelperTheme.bodyBlackBold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.00,
                            top: 10.00,
                            right: 20.00,
                            bottom: 10,
                          ),
                          child: TextFormField(
                            controller: _.amountController,
                            focusNode: _.amountFocusNode,
                            autocorrect: false,
                            decoration: HelperTheme().textInputDecoration(
                              'Selecciona el monto a transferir',
                            ),
                            validator: (value) => _.validatorAmout(value!),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.00,
                            top: 10.00,
                            right: 20.00,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: HelperTheme.ultraBlack,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.00,
                                    right: 10.00,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const SizedBox(
                                        width: 19,
                                        height: 21,
                                        child: Icon(
                                          Icons.info,
                                          color: HelperTheme.white,
                                          size: 30,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10.00,
                                            bottom: 10.00,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "Recuerde que las transferencias al BCP, BBVA, SCOTIBANK E INTERBANK son casi inmediatas. En el caso de otros bancos demorarán entre 48 a 72 horas",
                                                style: HelperTheme.body,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20.00,
                                  top: 15.00,
                                  right: 20.00,
                                  bottom: 20.00,
                                ),
                                child: ElevatedButton(
                                    style: HelperTheme().buttonStyle(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Retirar dinero',
                                          style: HelperTheme.buttonText,
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      _.setWallet(walletFormKey);
                                    }),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(
                                    color: HelperTheme.info,
                                    fontFamily: HelperTheme.fontSource,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
