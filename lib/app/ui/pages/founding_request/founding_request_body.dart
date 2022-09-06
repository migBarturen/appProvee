import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/founding_request_controller.dart';

class FoundingRequestBody extends StatelessWidget {
  const FoundingRequestBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoundingRequestController>(builder: (_) {
      return Column(
        children: const [
          Text('FoundingRequest'),
        ],
      );
    });
  }
}
