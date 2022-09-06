import 'package:flutter/material.dart';

import '../../../../data/models/notification_model.dart';
import '../../../themes/helper_theme.dart';

class NotificationCard extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final NotificationModel notification;

  const NotificationCard({
    Key? key,
    this.animationController,
    this.animation,
    required this.notification,
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
                  color: HelperTheme.ultraBlack,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 15),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: HelperTheme.info,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.notification_important_outlined,
                            size: 40,
                          )),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification.tipoNotificacion!,
                            style: HelperTheme.bodyMiniBold,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            notification.desNotificacion!,
                            style: HelperTheme.bodyMini,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: HelperTheme.white,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                notification.updatedAt
                                    .toString()
                                    .substring(0, 19),
                                style: HelperTheme.bodyMini,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
