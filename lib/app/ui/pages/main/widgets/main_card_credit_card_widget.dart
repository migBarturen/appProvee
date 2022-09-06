import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../themes/helper_theme.dart';

class MainCardCreditCardWidget extends GetWidget<MainController> {
  const MainCardCreditCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: HelperTheme.ultraBlack,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 0, right: 15),
                child: Icon(
                  Icons.notification_important_outlined,
                  size: 20,
                  color: HelperTheme.white,
                ),
              ),
              Expanded(
                child: Text(
                  'Para pagos con tarjeta de crédito te derivaremos a la pasarela de pago de Izi Pay, en donde tendrás que poner los datos de tu tarjeta.',
                  style: HelperTheme.bodyMini,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
