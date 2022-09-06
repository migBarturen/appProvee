import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/register_user_controller.dart';
import '../../../themes/helper_theme.dart';

class RegisterUserFormContact extends StatelessWidget {
  const RegisterUserFormContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();
    return GetBuilder<RegisterUserController>(builder: (_) {
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: contactFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Información de contacto',
                          style: HelperTheme.head,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Necesitamos saber donde te ubicas, por favor llena los campos con tu ubicación.',
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
                                  color: HelperTheme.ultraBlack,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HelperTheme.ultraBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _.addressController,
                          focusNode: _.addressFocusNode,
                          autocorrect: false,
                          keyboardType: TextInputType.streetAddress,
                          decoration: HelperTheme().textInputDecoration(
                            'Dirección',
                          ),
                          validator: (value) => _.validatorAddress(value!),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _.phoneController,
                          focusNode: _.phoneFocusNode,
                          autocorrect: false,
                          keyboardType: TextInputType.phone,
                          decoration: HelperTheme().textInputDecoration(
                            'Teléfono',
                          ),
                          validator: (value) => _.validatorPhone(value!),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _.emailController,
                          focusNode: _.emailFocusNode,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: HelperTheme().textInputDecoration(
                            'Correo electrónico',
                          ),
                          validator: (value) => _.validatorEmail(value!),
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
                            _.contact(contactFormKey);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
