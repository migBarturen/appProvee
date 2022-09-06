import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../../data/models/product_model.dart';
import '../../../themes/helper_theme.dart';
import '../main_product_detail_page.dart';

class MainCardProductWidget extends GetWidget<MainController> {
  const MainCardProductWidget(
      {Key? key,
      this.width = 150,
      this.height = 250,
      this.radius = 10,
      required this.data})
      : super(key: key);
  final double width;
  final double height;
  final double radius;
  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    String uri = data.fotos!.first.img!;
    Uint8List _bytes = base64.decode(uri.split(',').last);
    return GestureDetector(
      onTap: () {
        controller.updateProduct(data);
        controller.updateProductQuantity(1);
        Get.to(() => const MainProductDetailPage());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: data.id!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.memory(
                  _bytes,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 20, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.titulo.toString().toUpperCase(),
                    style: HelperTheme.bodyDetail,
                  ),
                  Text(
                    'S/. ${data.precio.toString()}',
                    style: HelperTheme.bodyDetailInfoBold,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
