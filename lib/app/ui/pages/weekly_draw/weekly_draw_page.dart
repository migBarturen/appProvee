import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/weekly_draw_controller.dart';
import '../../global_widgets/appbar_widget.dart';
import '../../global_widgets/loading_widget.dart';
import '../../global_widgets/navigation_drawer_widget.dart';
import '../../themes/helper_theme.dart';
import 'weekly_draw_body.dart';

class WeeklyDrawPage extends StatelessWidget {
  const WeeklyDrawPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeeklyDrawController>(
      init: WeeklyDrawController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: HelperTheme.black,
            appBar: AppBarWidget(title: 'Sorteo semanal'),
            drawer: const NavigationDrawerWidget(),
            body: Stack(
              children: <Widget>[
                const WeeklyDrawBody(),
                Obx(() {
                  if (_.globalController.isLoading.value) {
                    return const LoadingWidget();
                  }
                  return const SizedBox();
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
