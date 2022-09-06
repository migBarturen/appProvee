import 'dart:convert';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main_controller.dart';
import '../../../data/models/product_model.dart';
import '../../global_widgets/loading_widget.dart';
import '../../themes/helper_theme.dart';

class MainProductDetailPage extends GetView<MainController> {
  const MainProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel data = controller.product.value;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HelperTheme.black,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: HelperTheme.black,
        iconTheme: const IconThemeData(color: HelperTheme.white),
        title: const Text(
          'Producto',
          style: HelperTheme.titleAppBar,
          textAlign: TextAlign.left,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Text(
                    data.titulo ?? '',
                    style: HelperTheme.head,
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: Hero(
                    tag: data.id!,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        height: 250,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                      ),
                      items: List.generate(data.fotos!.length, (index) {
                        String uri = data.fotos![index].img!;
                        Uint8List bytes = base64.decode(uri.split(',').last);
                        return Builder(builder: (context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: HelperTheme.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.memory(
                                bytes,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        });
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'S/. ${data.precio.toString()}',
                        style: HelperTheme.headInfo,
                      ),
                      Text(
                        'Disponibles : ${data.cantidad.toString()}',
                        style: HelperTheme.bodyMini,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        'Cantidad :',
                        style: HelperTheme.body,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(flex: 3, child: Container()),
                      Expanded(
                        flex: 1,
                        child: Obx(
                          () => TextFormField(
                            initialValue:
                                controller.productQuantity.value.toString(),
                            autocorrect: false,
                            textAlign: TextAlign.end,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: HelperTheme.white,
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: HelperTheme.danger,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: HelperTheme.danger,
                                  )),
                            ),
                            onChanged: (value) {
                              if (value.trim() == '') {
                                controller.updateProductQuantity(0);
                              } else {
                                controller.updateProductQuantity(
                                    int.parse(value.toString()));
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    decoration: HelperTheme().buttonBoxDecoration(),
                    child: ElevatedButton(
                        style: HelperTheme().buttonStyle(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Comprar',
                              style: HelperTheme.buttonText,
                            )
                          ],
                        ),
                        onPressed: () {
                          controller.buyProduct();
                        }),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    'Detalle del producto',
                    style: HelperTheme.head,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    data.descripcion ?? '',
                    style: HelperTheme.body,
                    textAlign: TextAlign.justify,
                  ),
                )
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
