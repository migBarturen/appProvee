import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/weekly_draw_controller.dart';
import '../../themes/helper_theme.dart';

class WeeklyDrawBody extends StatelessWidget {
  const WeeklyDrawBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeeklyDrawController>(builder: (_) {
      return Stack(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: double.infinity,
                height: 170,
                child: Image.asset(
                  'assets/images/SliderSorteo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HelperTheme.gray100,
                  border: Border.all(
                    color: HelperTheme.gray300,
                    width: 1.00,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: HelperTheme.secondary,
                      spreadRadius: 2.00,
                      blurRadius: 2.00,
                      offset: Offset(
                        0,
                        2,
                      ),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10.00,
                        top: 15.00,
                        right: 10.00,
                      ),
                      child: Text(
                        'Oportunidades de sorteo',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: HelperTheme.bodyGray,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.00,
                        top: 10.00,
                        right: 10.00,
                        bottom: 10.00,
                      ),
                      child: Obx(
                        () => Text(
                          '${_.totalWeeklyDraw.value} tickets',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: HelperTheme.headBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.00,
                    top: 25.00,
                    right: 20.00,
                  ),
                  child: Obx(() {
                    if (_.status.value == 1) {
                      return bodyUI();
                    }
                    return const SizedBox();
                  }),
                ),
              ),
            ),
          ],
        ),
      ]);
    });
  }

  Widget bodyUI() {
    return GetBuilder<WeeklyDrawController>(builder: (_) {
      return FutureBuilder<bool>(
        future: _.getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox(
              height: 1,
            );
          } else {
            if (_.listViews.isEmpty) {
              return Column(
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
                    'Aún no tienes Tickets',
                    style: HelperTheme.head,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SizedBox(
                        width: 260,
                        child: Text(
                          'Todavía no haz ganado Tickets comprando en Provee',
                          style: HelperTheme.body,
                          textAlign: TextAlign.center,
                        )),
                  )
                ],
              );
            } else {
              return ListView.builder(
                itemCount: _.listViews.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return _.listViews[index];
                },
              );
            }
          }
        },
      );
    });
  }
}
