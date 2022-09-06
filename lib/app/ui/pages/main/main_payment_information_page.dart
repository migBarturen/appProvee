import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/main_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../themes/helper_theme.dart';

class MainPaymentInformationPage extends GetView<MainController> {
  const MainPaymentInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> informationFormKey = GlobalKey<FormState>();
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
          'Información del pago',
          style: HelperTheme.titleAppBar,
          textAlign: TextAlign.left,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Form(
            key: informationFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Información del pago',
                            style: HelperTheme.head,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Necesitamos validar tu pago. Por favor ingresa la información correspondiente a tu pago.',
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
                          TextFormField(
                            controller: controller.numberTransactionController,
                            focusNode: controller.numberTransactionFocusNode,
                            autocorrect: false,
                            decoration: HelperTheme().textInputDecoration(
                              'Número de transacción',
                            ),
                            validator: (value) =>
                                controller.validatorNumberTransaction(value!),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            height: 210,
                            color: HelperTheme.white,
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: HelperTheme.gray300,
                                    ),
                                    child: Center(
                                      child: Obx(
                                        () => (controller
                                                    .selectedImagePath.value ==
                                                '')
                                            ? GestureDetector(
                                                onTap: controller.fileUpload,
                                                child: Container(
                                                  width: 200,
                                                  height: 200,
                                                  color: Colors.transparent,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        Icons
                                                            .photo_camera_outlined,
                                                        size: 24,
                                                        color: HelperTheme.gray,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                          'Sube una imágen del voucher',
                                                          style: HelperTheme
                                                              .bodyGray,
                                                          textAlign:
                                                              TextAlign.center)
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.file(
                                                  File(controller
                                                      .selectedImagePath.value),
                                                  fit: BoxFit.fill,
                                                  width: 200,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  (() => (controller.selectedImagePath.value !=
                                          '')
                                      ? Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.confirmDeleteDialog();
                                            },
                                            child: Container(
                                              width: 30.0,
                                              height: 30.0,
                                              decoration: const BoxDecoration(
                                                color: HelperTheme.danger,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: HelperTheme.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(height: 1)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
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
                                    'Revisaremos la compra una vez hecho hayas hecho el pago. Te avisaremos en cuanto lo hayamos validado.',
                                    style: HelperTheme.bodyMini,
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
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
                          onPressed: () async {
                            await controller.save(informationFormKey);
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
