import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/login_controller.dart';
import '../../../themes/helper_theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    return GetBuilder<LoginController>(builder: (_) {
      return Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: Form(
          key: loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 63.16,
                width: 172.73,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
              const Text('Tu comercio electrónico de confianza',
                  style: HelperTheme.title),
              const SizedBox(height: 10),
              const Text(
                  'Gana comprando y vendiendo, ingresa a tu correo ahora',
                  style: HelperTheme.subTitle),
              const SizedBox(height: 10),
              TextFormField(
                controller: _.usernameController,
                focusNode: _.usernameFocusNode,
                autocorrect: false,
                decoration: HelperTheme().textInputDecoration(
                  'Ingresar correo electrónico.',
                ),
                validator: (value) => _.validatorUsername(value!),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _.passwordController,
                focusNode: _.passwordFocusNode,
                autocorrect: false,
                obscureText: _.showPassword.value,
                decoration: InputDecoration(
                  hintText: 'Ingresar contraseña.',
                  fillColor: HelperTheme.white,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Obx(() {
                      if (_.showPassword.value) {
                        return const Icon(Icons.visibility);
                      }
                      return const Icon(Icons.visibility_off);
                    }),
                    onPressed: () {
                      _.updateShowPassword(!_.showPassword.value);
                    },
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: HelperTheme.danger,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: HelperTheme.danger,
                      )),
                ),
                validator: (value) => _.validatorPassword(value!),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Obx(() {
                    return Checkbox(
                      value: _.isChecked.value,
                      checkColor: HelperTheme.black,
                      activeColor: HelperTheme.white,
                      fillColor: MaterialStateProperty.all(HelperTheme.white),
                      onChanged: (bool? value) {
                        _.changeIsChecked(value!);
                      },
                    );
                  }),
                  const Text(
                    "Recordar credenciales.",
                    style: HelperTheme.body,
                  ),
                ],
              ),
              Expanded(child: Container()),
              Container(
                decoration: HelperTheme().buttonBoxDecoration(),
                child: ElevatedButton(
                    style: HelperTheme().buttonStyle(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.login,
                          size: 24.0,
                          color: HelperTheme.white,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Ingresar',
                          style: HelperTheme.buttonText,
                        )
                      ],
                    ),
                    onPressed: () async {
                      await _.login(loginFormKey);
                    }),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      );
    });
  }
}
