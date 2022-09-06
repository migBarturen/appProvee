import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/register_user_controller.dart';
import '../../../themes/helper_theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RegisterUserFormPersonal extends StatelessWidget {
  const RegisterUserFormPersonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> personalFormKey = GlobalKey<FormState>();
    return GetBuilder<RegisterUserController>(builder: (_) {
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: personalFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Información personal',
                          style: HelperTheme.head,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Necesitamos conocerte, por favor llena los campos con tu información persona.',
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
                        DropdownButtonFormField2(
                          scrollbarAlwaysShow: true,
                          decoration: InputDecoration(
                            fillColor: HelperTheme.white,
                            filled: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 1.0)),
                          ),
                          hint: const Text(
                            'Seleccionar',
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: HelperTheme.black,
                          ),
                          iconSize: 30,
                          buttonHeight: 30,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          items: ['DNI', 'RUC', 'Carnet de extranjeria']
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: HelperTheme.black,
                                        fontFamily: HelperTheme.fontSource,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: (_.typeDocument.value == "")
                              ? null
                              : _.typeDocument.value,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'Por favor seleccionar tipo de documento';
                            }
                            return null;
                          },
                          onChanged: (value) async {
                            _.updateTypeDocument(value.toString());
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _.numberController,
                          focusNode: _.numberFocusNode,
                          autocorrect: false,
                          decoration: HelperTheme().textInputDecoration(
                            'Documento',
                          ),
                          validator: (value) => _.validatorNumber(value!),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => TextFormField(
                            controller: _.firstnameController,
                            focusNode: _.firstnameFocusNode,
                            autocorrect: false,
                            keyboardType: TextInputType.name,
                            decoration: (_.typeDocument.value == 'RUC')
                                ? HelperTheme().textInputDecoration(
                                    'Razon social',
                                  )
                                : HelperTheme().textInputDecoration(
                                    'Nombre',
                                  ),
                            validator: (value) => _.validatorFirstName(value!),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(() {
                          if (_.typeDocument.value == 'RUC') {
                            return const SizedBox(
                              height: 1,
                            );
                          } else {
                            return TextFormField(
                              controller: _.lastnameController,
                              focusNode: _.lastnameFocusNode,
                              autocorrect: false,
                              keyboardType: TextInputType.name,
                              decoration: HelperTheme().textInputDecoration(
                                'Apellidos',
                              ),
                              validator: (value) => _.validatorLastName(value!),
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                            _.personal(personalFormKey);
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
