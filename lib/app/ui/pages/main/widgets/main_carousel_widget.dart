import 'dart:convert';
import 'dart:typed_data';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../../data/models/slider_model.dart';
import '../../../themes/helper_theme.dart';

class MainCarouselWidget extends GetWidget<MainController> {
  const MainCarouselWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.activeSliders.isNotEmpty) {
        return FadeInUp(
          child: SizedBox(
            width: Get.width,
            height: 170,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
              ),
              itemCount: controller.activeSliders.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return buildOffer(controller.activeSliders[itemIndex]);
              },
            ),
          ),
        );
      } else {
        return const SizedBox(
          height: 170,
          child: Center(
              child: CircularProgressIndicator(
            color: HelperTheme.info,
          )),
        );
      }
    });
  }

  Widget buildOffer(SliderModel slider) {
    String uri = slider.imgSlider!;
    Uint8List _bytes = base64.decode(uri.split(',').last);

    return Container(
      width: Get.width,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
        image: DecorationImage(
          image: MemoryImage(
            _bytes,
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
