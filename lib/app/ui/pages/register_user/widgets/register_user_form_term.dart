import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/register_user_controller.dart';
import '../../../themes/helper_theme.dart';

class RegisterUserFormTerm extends StatelessWidget {
  const RegisterUserFormTerm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterUserController>(builder: (_) {
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Terminos y condiciones',
                        style: HelperTheme.head,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Finalmente por tu seguridad debes aceptar nuestros terminos y condiciones.',
                        style: HelperTheme.body,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HelperTheme.info,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HelperTheme.info,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HelperTheme.info,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HelperTheme.info,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Scrollbar(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 350,
                          child: ListView.builder(
                            itemCount: _.terms.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return _.terms[index];
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Obx(() {
                            return Checkbox(
                              value: _.isChecked.value,
                              checkColor: HelperTheme.black,
                              activeColor: HelperTheme.white,
                              fillColor: MaterialStateProperty.all(
                                  HelperTheme.white),
                              onChanged: (bool? value) {
                                _.changeIsChecked(value!);
                              },
                            );
                          }),
                          Flexible(
                            child: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Tengo 18 años de edad o mas y he leido y aceptado los ',
                                    style: TextStyle(
                                      color: HelperTheme.white,
                                      fontFamily: HelperTheme.fontSource,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'terminos y condiciones',
                                    style: TextStyle(
                                      color: HelperTheme.white,
                                      fontFamily: HelperTheme.fontSource,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HelperTheme.secondary,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.navigate_before,
                          color: HelperTheme.white,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HelperTheme.success,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.navigate_next,
                          color: HelperTheme.white,
                        ),
                        onPressed: () {
                          _.term();
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
