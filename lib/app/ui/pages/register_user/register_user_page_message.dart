import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/register_user_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../themes/helper_theme.dart';

class RegisterUserPageMessage extends StatelessWidget {
  const RegisterUserPageMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterUserController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: HelperTheme.black,
            body: Stack(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 100,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      left: 15,
                                      child: Image.asset(
                                          'assets/images/ellipse_2.png'),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 25,
                                      child: Image.asset(
                                          'assets/images/ellipse_3.png'),
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: 30,
                                      child: Image.asset(
                                          'assets/images/ellipse_1.png'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Text(
                                '¡Genial!',
                                style: HelperTheme.head,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                width: 266,
                                child: Text(
                                  'Tu registro a sido exitoso, Ganar dinero comprando esta a la vuelta de la esquina o pantalla...😁',
                                  style: HelperTheme.titleAppBar,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: HelperTheme().buttonBoxDecoration(),
                          child: ElevatedButton(
                              style: HelperTheme().buttonStyle(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.home,
                                    size: 24.0,
                                    color: HelperTheme.white,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Inicio',
                                    style: HelperTheme.buttonText,
                                  )
                                ],
                              ),
                              onPressed: ()  {
                                _.login();
                              }),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )),
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
