import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../themes/helper_theme.dart';

class MainFilterWidget extends GetWidget<MainController> {
  const MainFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Obx(() {
          // ignore: unrelated_type_equality_checks
          if (controller.showBadgesProduct.value) {
            return Badge(
              badgeColor: HelperTheme.danger,
              badgeContent: Text(
                controller.listProductViews.length.toString(),
                style: const TextStyle(color: HelperTheme.white, fontSize: 12),
              ),
              child: const Icon(Icons.filter_list_outlined,
                  color: HelperTheme.info, size: 30),
            );
          } else {
            return const Icon(Icons.filter_list_outlined,
                color: HelperTheme.info, size: 30);
          }
        }),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            controller.filterDialog();
          },
          child: const Text(
            'Filtrar productos y servicios',
            style: HelperTheme.bodyLink,
          ),
        )
      ],
    );
  }
}
