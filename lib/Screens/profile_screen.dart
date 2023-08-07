import 'package:duocode/Components/button_component.dart';
import 'package:duocode/Components/button_w_text_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/text_component.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SizedBox(
            width: Get.width * 1,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 20, bottom: 10),
                      //Foto de perfil
                      child: Container(
                        width: 120,
                        height: 120,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              right: 16,
                              left: 12,
                            ),
                            child: ComponentText(
                              fontSize: 22,
                              overflow: TextOverflow.visible,
                              text: "Feliperson Mottos",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 6, right: 16, left: 12),
                            child: Container(
                              height: 75,
                              color: Colors.blue,
                              child: Row(
                                children: [
                                  Container(
                                    color: const Color.fromARGB(
                                        255, 173, 171, 165),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    height: 60,
                                    width: 60,
                                  ),
                                  ComponentText(
                                    text: "Nivel ???",
                                    fontSize: 25,
                                    boldFont: true,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.blue,
                  thickness: 0.5,
                ),
                Row(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 32, 32, 32),
                      margin: const EdgeInsets.only(left: 12, top: 12),
                      height: Get.height * 0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //Left
                        children: [
                          Container(
                            height: 120,
                            width: Get.width * 0.45,
                            color: Color.fromARGB(255, 6, 172, 150),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            height: 75,
                            width: Get.width * 0.45,
                            color: Color.fromARGB(255, 6, 172, 150),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: const Color.fromARGB(255, 32, 32, 32),
                      height: Get.height * 0.3,
                      margin:
                          const EdgeInsets.only(left: 12, right: 12, top: 12),
                      child: Column(
                        //Right
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: Get.width * 0.45,
                            color: const Color.fromARGB(255, 6, 172, 150),
                            child: ComponentTextButton(
                              text: "Editar Perfil",
                              textColor: Colors.black,
                              spaceBetweenIconAndText: 5,
                              mainAxisAlignment: MainAxisAlignment.center,
                              fontSize: 20,
                              iconSize: 30,
                              iconColor: Colors.black,
                              icon: Icons.person,
                              onPressed: () {
                                //TODO
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            height: 50,
                            width: Get.width * 0.45,
                            color: Color.fromARGB(255, 6, 172, 150),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
