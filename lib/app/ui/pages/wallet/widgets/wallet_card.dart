import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/helper_theme.dart';

// ignore: must_be_immutable
class WalletCard extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  // ignore: prefer_typing_uninitialized_variables
  final data;

  const WalletCard({
    Key? key,
    this.animationController,
    this.animation,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: HelperTheme.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.00,
                      top: 10.00,
                      right: 10.00,
                      bottom: 10.00,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              size: 20,
                              color: HelperTheme.gray,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              data.createdAt.toString().substring(0, 19),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: HelperTheme.bodyBlack,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1.00,
                    width: Get.width,
                    margin: const EdgeInsets.only(
                        left: 10.00, top: 11.00, right: 10.00),
                    decoration: const BoxDecoration(
                      color: HelperTheme.gray300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.00, top: 10.00, right: 10.00, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          data.descripcion ?? '',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: HelperTheme.bodyBlack,
                        ),
                        Text(
                          'S/. ${data.monto}',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: HelperTheme.bodyBlackBold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
