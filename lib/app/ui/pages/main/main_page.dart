import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main_controller.dart';
import '../../global_widgets/appbar_widget.dart';
import '../../global_widgets/loading_widget.dart';
import '../../global_widgets/navigation_drawer_widget.dart';
import '../../themes/helper_theme.dart';
import 'widgets/main_product_widget.dart';
import 'widgets/main_carousel_widget.dart';
import 'widgets/main_filter_widget.dart';
import 'widgets/main_search_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: HelperTheme.black,
            appBar: AppBarWidget(),
            drawer: const NavigationDrawerWidget(),
            body: WillPopScope(
              onWillPop: () async => false,
              child: Stack(
                children: <Widget>[
                  const MainBody(),
                  Obx(() {
                    if (_.globalController.isLoading.value) {
                      return const LoadingWidget();
                    }
                    return const SizedBox();
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: const [
          MainCarouselWidget(),
          SizedBox(height: 10),
          MainSearchWidget(),
          SizedBox(height: 10),
          MainFilterWidget(),
          SizedBox(height: 10),
          Expanded(
            child: MainProductWidget(),
          )
        ],
      ),
    );
  }
}
