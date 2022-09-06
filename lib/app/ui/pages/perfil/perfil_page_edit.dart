import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/perfil_controller.dart';
import '../../global_widgets/loading_widget.dart';
import '../../themes/helper_theme.dart';

class PerfilPageEdit extends StatelessWidget {
  const PerfilPageEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> perfilFormKey = GlobalKey<FormState>();
    return GetBuilder<PerfilController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: HelperTheme.black,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: false,
              elevation: 0,
              backgroundColor: HelperTheme.black,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: HelperTheme.white,
                ),
                onPressed: () => Get.back(),
              ),
              title: const Text(
                'Editar perfil',
                style: HelperTheme.titleAppBar,
              ),
            ),
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Form(
                    key: perfilFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Información personal',
                            style: HelperTheme.head,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: DropdownButtonFormField2(
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
                              'Seleccionar tipo documento',
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 30,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            items: List.generate(
                              _.globalController.documentList.length,
                              (index) => DropdownMenuItem<String>(
                                value: _.globalController.documentList[index]
                                    ["value"],
                                child: Row(
                                  children: [
                                    Text(
                                      _.globalController.documentList[index]
                                          ["value"],
                                      style: HelperTheme.bodyBlack,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            value: (_.globalController.user.value
                                        .docIdentidad! ==
                                    "")
                                ? null
                                : _.globalController.user.value.docIdentidad,
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Por favor seleccionar tipo documento';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _.updateTypeDocumet(value.toString());
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: TextFormField(
                            controller: _.numberController,
                            focusNode: _.numberFocusNode,
                            autocorrect: false,
                            decoration: HelperTheme().textInputDecoration(
                              'Ingresar nro de documento.',
                            ),
                            validator: (value) => _.validatorNumber(value!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: TextFormField(
                            controller: _.nameController,
                            focusNode: _.nameFocusNode,
                            autocorrect: false,
                            decoration: HelperTheme().textInputDecoration(
                              'Ingresar nombre(s).',
                            ),
                            validator: (value) => _.validatorName(value!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: TextFormField(
                            controller: _.lastnameController,
                            focusNode: _.lastnameFocusNode,
                            autocorrect: false,
                            decoration: HelperTheme().textInputDecoration(
                              'Ingresar nombre(s).',
                            ),
                            validator: (value) => _.validatorLastName(value!),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Información de contacto',
                            style: HelperTheme.head,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: TextFormField(
                            controller: _.emailController,
                            focusNode: _.emailFocusNode,
                            autocorrect: false,
                            decoration: HelperTheme().textInputDecoration(
                              'Ingresar correo electrónico',
                            ),
                            validator: (value) => _.validatorEmail(value!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: TextFormField(
                            controller: _.addressController,
                            focusNode: _.addressFocusNode,
                            autocorrect: false,
                            decoration: HelperTheme().textInputDecoration(
                              'Ingresar dirección',
                            ),
                            validator: (value) => _.validatorAddress(value!),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Información bancaria',
                            style: HelperTheme.head,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: DropdownButtonFormField2(
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
                              'Seleccionar banco',
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 30,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            items: List.generate(
                              _.globalController.bankList.length,
                              (index) => DropdownMenuItem<String>(
                                value: _.globalController.bankList[index]
                                    ["value"],
                                child: Row(
                                  children: [
                                    Text(
                                      _.globalController.bankList[index]
                                          ["name"],
                                      style: HelperTheme.bodyBlack,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            value: _.globalController.user.value.banco,
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Por favor seleccionar banco';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _.updateBank(value.toString());
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Número de cuenta',
                                style: HelperTheme.body,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _.numberBankController,
                                focusNode: _.numberBankFocusNode,
                                autocorrect: false,
                                decoration: HelperTheme().textInputDecoration(
                                  'Ingresar cuenta',
                                ),
                                validator: (value) =>
                                    _.validatorNumberBank(value!),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Número de CCI',
                                style: HelperTheme.body,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _.cciBankController,
                                focusNode: _.cciBankFocusNode,
                                autocorrect: false,
                                decoration: HelperTheme().textInputDecoration(
                                  'Ingresar número de CCI',
                                ),
                                validator: (value) =>
                                    _.validatorCciBank(value!),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20.00,
                                  ),
                                  child: ElevatedButton(
                                      style: HelperTheme().buttonStyle(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Guardar cambios',
                                            style: HelperTheme.buttonText,
                                          )
                                        ],
                                      ),
                                      onPressed: () {
                                        _.edit(perfilFormKey);
                                      }),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    'Cancelar',
                                    style: TextStyle(
                                      color: HelperTheme.info,
                                      fontFamily: HelperTheme.fontSource,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
