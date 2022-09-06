import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/perfil_controller.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PerfilController>(builder: (_) {
      return Column(
        children: const [
          Text('Mis pedidos'),
        ],
      );
    });
  }
}
