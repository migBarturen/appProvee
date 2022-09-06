import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../../data/models/bank_model.dart';
import '../../../themes/helper_theme.dart';

class MainCardWireTransferWidget extends GetWidget<MainController> {
  const MainCardWireTransferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Banco', style: HelperTheme.body),
        const SizedBox(height: 10),
        DropdownButtonFormField2(
          style: HelperTheme.bodyBlack,
          scrollbarAlwaysShow: true,
          dropdownMaxHeight: 200,
          decoration: InputDecoration(
            fillColor: HelperTheme.white,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey.shade400)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.0)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.0)),
          ),
          hint: const Text(
            'Seleccionar banco',
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
          buttonHeight: 24,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          items: List.generate(
            controller.bankList.length,
            (index) => DropdownMenuItem<String>(
              value: controller.bankList[index].desBanco ?? '',
              child: Row(
                children: [
                  Text(
                    controller.bankList[index].desBanco ?? '',
                    style: HelperTheme.bodyBlack,
                  ),
                ],
              ),
            ),
          ),
          value: (controller.selectedBank.value == "")
              ? null
              : controller.selectedBank.value,
          validator: (value) {
            if (value == null || value == '') {
              return 'Por favor seleccionar banco';
            }
            return null;
          },
          onChanged: (data) {
            BankModel bank = controller.bankList
                .where((b) => b.desBanco == data.toString())
                .first;
            controller.selectedBank.value = bank.desBanco!;
            controller.selectedBankNumber.value = bank.numCc ?? '';
            controller.selectedBankCCI.value = bank.numCci ?? '';
          },
        ),
        const SizedBox(height: 10),
        const Text('Número de cuenta', style: HelperTheme.body),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(
              () => Text(
                controller.selectedBankNumber.value,
                style: HelperTheme.bodyBlackBold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text('Número de CCI', style: HelperTheme.body),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(
              () => Text(
                controller.selectedBankCCI.value,
                style: HelperTheme.bodyBlackBold,
              ),
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
                  'Para transferencias por BCP, porfavor transfiere el monto exacto al número que aparece en pantalla',
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
