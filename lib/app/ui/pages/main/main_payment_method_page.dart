import 'dart:convert';
import 'dart:typed_data';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../themes/helper_theme.dart';
import 'widgets/main_card_credit_card_widget.dart';
import 'widgets/main_card_wire_transfer_widget.dart';
import 'widgets/main_card_yape_plin_widget.dart';

class MainPaymentMethodPage extends GetView<MainController> {
  const MainPaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> methodFormKey = GlobalKey<FormState>();
    String uri = controller.product.value.fotos!.first.img!;
    Uint8List _bytes = base64.decode(uri.split(',').last);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HelperTheme.black,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: HelperTheme.black,
        iconTheme: const IconThemeData(color: HelperTheme.white),
        title: const Text(
          'Método de pago',
          style: HelperTheme.titleAppBar,
          textAlign: TextAlign.left,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Form(
            key: methodFormKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Metodo de pago',
                            style: HelperTheme.head,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Por favor, selecciona el metodo de pago que usaras para comprar este producto.',
                            style: HelperTheme.body,
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10, right: 10),
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.black,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.memory(
                                            _bytes,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.product.value.titulo!,
                                              style: HelperTheme.bodyBlack,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'S/. ${controller.product.value.precio.toString()}',
                                              style: HelperTheme.bodyBlackBold,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: HelperTheme.gray300,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Cantidad: ${controller.productQuantity.value}',
                                        style: HelperTheme.bodyMiniBlackBold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          DropdownButtonFormField2(
                            scrollbarAlwaysShow: true,
                            dropdownMaxHeight: 200,
                            decoration: InputDecoration(
                              fillColor: HelperTheme.white,
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 0, 5, 0),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 1.0)),
                            ),
                            hint: const Text(
                              'Seleccionar método de pago',
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: HelperTheme.black,
                            ),
                            iconSize: 24,
                            buttonHeight: 24,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            items: [
                              'Yape / Plin',
                              'Transferencias interbancarias',
                            ]
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: HelperTheme.black,
                                          fontFamily: HelperTheme.fontSource,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: (controller.paymentMethod.value == "")
                                ? null
                                : controller.paymentMethod.value,
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Por favor seleccionar método de pago';
                              }
                              return null;
                            },
                            onChanged: (value) async {
                              controller.updatePaymentMethod(value.toString());
                            },
                          ),
                          const SizedBox(height: 15),
                          Obx(() {
                            if (controller.paymentMethod.value ==
                                'Yape / Plin') {
                              return const MainCardYapePlinWidget();
                            } else if (controller.paymentMethod.value ==
                                'Transferencias interbancarias') {
                              return const MainCardWireTransferWidget();
                            } else if (controller.paymentMethod.value ==
                                'Tarjetas de crédito') {
                              return const MainCardCreditCardWidget();
                            }
                            return const SizedBox(
                              height: 1,
                            );
                          }),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HelperTheme.secondary,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.navigate_before,
                            color: HelperTheme.white,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HelperTheme.success,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.navigate_next,
                            color: HelperTheme.white,
                          ),
                          onPressed: () {
                            controller.buyInformation(methodFormKey);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            if (controller.globalController.isLoading.value) {
              return const LoadingWidget();
            }
            return const SizedBox();
          }),
        ],
      ),
    );
  }
}
