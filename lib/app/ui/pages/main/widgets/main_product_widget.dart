import 'package:animate_do/animate_do.dart';
import 'package:app_provee/app/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:masonry_grid/masonry_grid.dart';

import '../../../themes/helper_theme.dart';

class MainProductWidget extends GetWidget<MainController> {
  const MainProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.listProductViews.isNotEmpty) {
        return FadeInUp(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: MasonryGrid(
                      column: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(
                        controller.listProductViews.length,
                        (i) => controller.listProductViews[i],
                      )))
            ],
          ),
        );
      } else if (controller.listProductViews.isEmpty &&
          controller.loadingProduct.value) {
        return const Center(
            child: CircularProgressIndicator(
          color: HelperTheme.info,
        ));
      } else {
        return Center(
          child: Column(
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
                'Sin informacón para mostrar',
                style: HelperTheme.head,
              ),
            ],
          ),
        );
      }
    });
  }
}
