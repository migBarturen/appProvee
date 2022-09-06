import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';
import '../../../themes/helper_theme.dart';

class MainSearchWidget extends GetWidget<MainController> {
  const MainSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.searchController,
      focusNode: controller.searchNode,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: 'Buscar productos y servicios',
        fillColor: HelperTheme.white,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () async {
            await controller.getProducts();
            controller.showBadgesProduct.value = true;
          },
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
    );
  }
}
