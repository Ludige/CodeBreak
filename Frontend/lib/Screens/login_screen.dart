import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/input_component.dart';
import '../Components/text_button_component.dart';
import '../Misc/SharedPreference.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  SharedPreference sharedPreferences = SharedPreference();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _visiblePassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(children: [
          Flexible(
            child: Container(),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                ComponentInput(
                  labelText: "Usuario", //'user'.tr
                  controller: _userController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ComponentInput(
                  //Senha
                  obscureText: !_visiblePassword,
                  labelText: "Senha", //password'.tr,
                  controller: _passwordController,

                  suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: _visiblePassword
                        ? const Icon(
                            Icons.visibility_sharp,
                            size: 23,
                          )
                        : const Icon(
                            Icons.visibility_off_sharp,
                            // size: 23,
                          ),
                    color: Colors.grey,
                    onPressed: () {
                      setState(
                        () {
                          _visiblePassword = !_visiblePassword;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          //TODO Implementar Registrar
          // Flexible(
          //   child: Row(
          //     children: [
          //       Container(
          //         width: Get.width,
          //         padding: const EdgeInsets.only(top: 15),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(
          //               'nullaccount'.tr,
          //               style: const TextStyle(fontFamily: 'Imprima-Regular'),
          //             ),
          //             ComponentTextButton(
          //               text: 'register'.tr,
          //               hoverAnimation: false,
          //               textColor: Colors.purple,
          //               onPressed: () async {
          //                 await Get.toNamed("/register");
          //               },
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Flexible(
            child: Container(),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Row(
              //Texto e Botao
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  //Texto
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Esqueceu sua senha?", //'forgotpassword'.tr,
                      style: TextStyle(fontFamily: 'Imprima-Regular'),
                    ),
                    ComponentTextButton(
                      text: 'recover'.tr,
                      hoverAnimation: false,
                      textColor: Colors.purple,
                      onPressed: () async {
                        //TODO Implementar
                        await Get.toNamed("/cadastro");
                      },
                    ),
                  ],
                ),
                // ComponentButton(
                //   text: "login",//'login'.tr,
                //   onPressed: () async {
                //     if (_formKey.currentState!.validate()) {
                //       int statusCode = await ApiConnections.login(
                //         _userController.text,
                //         _passwordController.text,
                //       );

                //       if (statusCode == 200) {
                //         if (await ApiService.getProfileData()) {
                //           sharedPreferences.saveTokenStatus();
                //           Get.offAndToNamed("/home");
                //         }
                //       } else {
                //         Get.snackbar(
                //           'loginError'.tr,
                //           'validData'.tr,
                //           snackPosition: SnackPosition.BOTTOM,
                //           backgroundColor: const Color.fromARGB(255, 138, 8, 8),
                //           borderRadius: 2,
                //           duration: const Duration(milliseconds: 3000),
                //           isDismissible: true,
                //           dismissDirection: DismissDirection.horizontal,
                //           forwardAnimationCurve: Curves.easeOutBack,
                //         );
                //       }
                //     }
                //   },
                // ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
