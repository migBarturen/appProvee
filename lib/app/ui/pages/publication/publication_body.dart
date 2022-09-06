import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/share_link_controller.dart';

class PublicationBody extends StatelessWidget {
  const PublicationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareLinkController>(builder: (_) {
      return Column(
        children: const [
          Text('Mis publicaciones'),
        ],
      );
    });
  }
}
