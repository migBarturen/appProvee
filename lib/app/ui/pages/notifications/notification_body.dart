import 'package:app_provee/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/notification_controller.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (_) {
      return Container(
        color: HelperTheme.black,
        child: Stack(
          children: <Widget>[
            Obx(() {
              if (_.status.value == 1) {
                return bodyUI();
              }
              return const SizedBox();
            })
          ],
        ),
      );
    });
  }

  Widget bodyUI() {
    return GetBuilder<NotificationController>(builder: (_) {
      return FutureBuilder<bool>(
        future: _.getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox(
              height: 1,
            );
          } else {
            if (_.listViews.isNotEmpty) {
              return Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ListView.builder(
                  itemCount: _.listViews.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return _.listViews[index];
                  },
                ),
              );
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
                      'Aún no tienes notificaciones',
                      style: HelperTheme.head,
                    ),
                  ],
                ),
              );
            }
          }
        },
      );
    });
  }
}
