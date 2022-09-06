import 'package:app_provee/app/controllers/global_controller.dart';
import 'package:app_provee/app/ui/themes/helper_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'package:basic_utils/basic_utils.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalController = Get.find<GlobalController>();
    return Drawer(
      backgroundColor: HelperTheme.black,
      child: Column(
        children: [
          Container(
            color: HelperTheme.black,
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hola',
                  style: HelperTheme.bodyLgMenu,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  StringUtils.capitalize(
                      globalController.user.value.desNombres.toString()),
                  style: HelperTheme.bodyMenu,
                ),
              ],
            ),
          ),
          Container(
            color: HelperTheme.gray,
            height: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: ListView(
                children: <Widget>[
                  buildMenuItem(
                    text: 'Inicio',
                    icon: Icons.home,
                    selectedColor: Get.currentRoute == Routes.MAIN
                        ? HelperTheme.white
                        : HelperTheme.gray,
                    tileColor: Get.currentRoute == Routes.MAIN
                        ? HelperTheme.secondary
                        : null,
                    onTap: () => navigate(0),
                  ),
                  buildMenuItem(
                    text: 'Perfil',
                    icon: Icons.people,
                    selectedColor: Get.currentRoute == Routes.PERFIL
                        ? HelperTheme.white
                        : HelperTheme.gray,
                    tileColor: Get.currentRoute == Routes.PERFIL
                        ? HelperTheme.secondary
                        : null,
                    onTap: () => navigate(1),
                  ),
                  buildMenuItem(
                    text: 'Sorteo semanal',
                    icon: Icons.card_giftcard,
                    selectedColor: Get.currentRoute == Routes.WEEKLY_DRAW
                        ? HelperTheme.white
                        : HelperTheme.gray,
                    tileColor: Get.currentRoute == Routes.WEEKLY_DRAW
                        ? HelperTheme.secondary
                        : null,
                    onTap: () => navigate(2),
                  ),
                  buildMenuItem(
                    text: 'Billetera virtual',
                    icon: Icons.wallet,
                    selectedColor: Get.currentRoute == Routes.WALLET
                        ? HelperTheme.white
                        : HelperTheme.gray,
                    tileColor: Get.currentRoute == Routes.WALLET
                        ? HelperTheme.secondary
                        : null,
                    onTap: () => navigate(3),
                  ),
                  buildMenuItem(
                    text: 'Mis pedidos',
                    icon: Icons.shopping_cart_outlined,
                    selectedColor: Get.currentRoute == Routes.ORDER
                        ? HelperTheme.white
                        : HelperTheme.gray,
                    tileColor: Get.currentRoute == Routes.ORDER
                        ? HelperTheme.secondary
                        : null,
                    onTap: () => navigate(4),
                  ),
                  buildMenuItem(
                    text: 'Mis publicaciones',
                    icon: Icons.format_line_spacing_sharp,
                    selectedColor: Get.currentRoute == Routes.PUBLICATION
                        ? HelperTheme.white
                        : HelperTheme.gray,
                    tileColor: Get.currentRoute == Routes.PUBLICATION
                        ? HelperTheme.secondary
                        : null,
                    onTap: () => navigate(5),
                  ),
                  buildMenuItem(
                    text: 'Asesor virtual',
                    icon: Icons.phone_callback,
                    selectedColor: HelperTheme.gray,
                    tileColor: null,
                    onTap: () => navigate(6),
                  ),
                  buildMenuItem(
                    text: 'Cambiar contraseña',
                    icon: Icons.password,
                    selectedColor: Get.currentRoute == Routes.CHANGE_PASSWORD
                        ? HelperTheme.white
                        : HelperTheme.gray,
                    tileColor: Get.currentRoute == Routes.CHANGE_PASSWORD
                        ? HelperTheme.secondary
                        : null,
                    onTap: () => navigate(7),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: HelperTheme.gray,
            height: 1,
          ),
          Container(
              height: 50,
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: ListView(
                children: [
                  buildMenuItem(
                    text: 'Salir',
                    icon: Icons.logout_rounded,
                    selectedColor: Get.currentRoute == Routes.CHANGE_PASSWORD
                        ? HelperTheme.white
                        : HelperTheme.gray,
                    tileColor: Get.currentRoute == Routes.CHANGE_PASSWORD
                        ? HelperTheme.secondary
                        : null,
                    onTap: () => navigate(8),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required Color selectedColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      dense: true,
      leading: Icon(
        icon,
        color: selectedColor,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: HelperTheme.fontSource,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      tileColor: tileColor,
      textColor: selectedColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.offNamed(Routes.MAIN);
    } else if (index == 1) {
      Get.offNamed(Routes.PERFIL);
    } else if (index == 2) {
      Get.offNamed(Routes.WEEKLY_DRAW);
    } else if (index == 3) {
      Get.offNamed(Routes.WALLET);
    } else if (index == 4) {
      Get.offNamed(Routes.ORDER);
    } else if (index == 5) {
      Get.offNamed(Routes.PUBLICATION);
    } else if (index == 7) {
      Get.offNamed(Routes.CHANGE_PASSWORD);
    } else if (index == 8) {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
