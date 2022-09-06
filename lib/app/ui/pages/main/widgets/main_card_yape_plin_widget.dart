import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../../../controllers/main_controller.dart';
import '../../../themes/helper_theme.dart';

class MainCardYapePlinWidget extends GetWidget<MainController> {
  const MainCardYapePlinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Image.asset(
                    'assets/images/whatsapp.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Text(
                      controller.product.value.usuario!.numTel!,
                      style: HelperTheme.headBlack,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                        text: controller.product.value.usuario!.numTel!,
                      ));
                      Get.snackbar(
                        'Notificacíon',
                        'Número copiado a portapapeles',
                        snackPosition: SnackPosition.TOP,
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 25,
                        ),
                        colorText: Colors.white,
                        backgroundColor: HelperTheme.success,
                        borderColor: HelperTheme.success,
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
                    },
                    child: const Text('Copiar'))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
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
                  'Para transferencias por Plin, porfavor plinea el monto exacto al número que aparece en pantalla',
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
