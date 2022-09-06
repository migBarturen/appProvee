import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/main_controller.dart';
import '../../themes/helper_theme.dart';

class MainMessagePage extends GetView<MainController> {
  const MainMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HelperTheme.black,
      body: WillPopScope(
        onWillPop: () async => false,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '😀',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(height: 15),
                      const Text('¡Wooow!', style: HelperTheme.bodyBold),
                      const SizedBox(height: 15),
                      const SizedBox(
                        width: 266,
                        child: Text(
                          'Asi de fácil es comprar y ganar, antes debemos de validar tu pago, te avisaremos cuando ya haya sido validado.',
                          style: HelperTheme.body,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: HelperTheme.gray100,
                            borderRadius: BorderRadius.circular(10),
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
                                  'Dinero por ganar por esta compra',
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
                                child: Text(
                                  'S/ ${controller.gain().toStringAsFixed(2)}',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: HelperTheme.headBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: HelperTheme.gray100,
                            borderRadius: BorderRadius.circular(10),
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
                            children: const [
                              Padding(
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
                                padding: EdgeInsets.only(
                                  left: 10.00,
                                  top: 10.00,
                                  right: 10.00,
                                  bottom: 10.00,
                                ),
                                child: Text(
                                  '1 ticket',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: HelperTheme.headBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
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
                            'Volver al inicio',
                            style: HelperTheme.buttonText,
                          )
                        ],
                      ),
                      onPressed: () {
                        controller.mainPage();
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
