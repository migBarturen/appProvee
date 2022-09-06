import 'package:app_provee/app/ui/pages/wallet/wallet_page_withdraw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/wallet_controller.dart';
import '../../themes/helper_theme.dart';

class WalletBody extends StatelessWidget {
  const WalletBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(builder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
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
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.00,
                      top: 15.00,
                      right: 10.00,
                      bottom: 15.00,
                    ),
                    child: Container(
                      width: 180,
                      decoration: HelperTheme().buttonBoxDecoration(),
                      child: ElevatedButton(
                          style: HelperTheme().buttonStyle(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Retirar dinero',
                                style: HelperTheme.buttonText,
                              )
                            ],
                          ),
                          onPressed: () {
                            /*
                            if (double.parse(_.wallet.value.total ?? '') > 0) {
                              Get.to(
                                const WalletPageWithdraw(),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(seconds: 1),
                              );
                            } else {
                              SnackbarUtil().snackbarError('Error',
                                  'No tiene saldo disponible para retiro.');
                            }
                            */
                            Get.to(
                              const WalletPageWithdraw(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(seconds: 1),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.00,
                  top: 25.00,
                  right: 20.00,
                ),
                child: Obx(() {
                  if (_.status.value == 1) {
                    return bodyUI();
                  }
                  return const SizedBox();
                }),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget bodyUI() {
    return GetBuilder<WalletController>(builder: (_) {
      return FutureBuilder<bool>(
        future: _.getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox(
              height: 1,
            );
          } else {
            if (_.listViews.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '🎰',
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Aún no tienes billetera',
                    style: HelperTheme.head,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SizedBox(
                        width: 260,
                        child: Text(
                          'Todavía no tiene billetera en Provee',
                          style: HelperTheme.body,
                          textAlign: TextAlign.center,
                        )),
                  )
                ],
              );
            } else {
              return ListView.builder(
                itemCount: _.listViews.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return _.listViews[index];
                },
              );
            }
          }
        },
      );
    });
  }
}
