
import 'package:app_provee/app/ui/pages/notifications/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/helper_theme.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  
  String? title;
  
  AppBarWidget({Key? key, this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0,
      elevation: 0,
      backgroundColor: HelperTheme.black,
      iconTheme: const IconThemeData(color: HelperTheme.white),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (title == null)? Image.asset('assets/images/logo.png') : Text(title!, style: HelperTheme.titleAppBar,),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Text(
              'S/. 0.00',
              style: HelperTheme.bodyAppBar,
            ),
          ),
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              Get.to(const NotificationPage());
            },
            child: const Icon(
              Icons.notifications,
              color: HelperTheme.info,
              size: 30,
            ),
          ),
        ),
      ],
      automaticallyImplyLeading: true,
    );
  }
}
