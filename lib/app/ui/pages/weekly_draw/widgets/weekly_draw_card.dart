import 'package:flutter/material.dart';

import '../../../../data/models/weekly_draw_model.dart';
import '../../../themes/helper_theme.dart';

class WeeklyDrawCard extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final WeeklyDrawModel data;

  const WeeklyDrawCard({
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
                        top: 5,
                        bottom: 0.00,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 1.17,
                            ),
                            child: Icon(
                              Icons.calendar_month,
                              size: 20,
                              color: HelperTheme.gray,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              top: 1.42,
                              bottom: 0.41,
                            ),
                            child: Text(
                              data.createdAt!.toString().substring(0, 10),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: HelperTheme.bodyBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.00, top: 5, right: 10.00, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(20),
                              child: Image.asset('assets/images/avatar.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              data.usuario!.desNombres ?? '',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: HelperTheme.bodyBlackBold,
                            ),
                          ),
                          Text(
                            "S/. ${data.monto}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: HelperTheme.headGreen,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
