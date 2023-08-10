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
          backgroundColor: Colors.black87,
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
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            border: Border.all(
                              color: Colors.yellowAccent,
                            ),
                          ),
                          child: ComponentTextButton(
                            icon: Icons.add_a_photo_outlined,
                            iconColor: Colors.yellowAccent,
                            mainAxisAlignment: MainAxisAlignment.center,
                            iconSize: 25,
                            onPressed: () {},
                          )),
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
                              fontSize: 20,
                              overflow: TextOverflow.visible,
                              text: "Feliperson Mottos",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 6, right: 16, left: 12),
                            child: Container(
                              height: 75,
                              color: Colors.black38,
                              child: Row(
                                children: [
                                  Container(
                                    color: Colors.yellow,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    height: 55,
                                    width: 55,
                                  ),
                                  ComponentText(
                                    text: "Nivel ???",
                                    fontSize: 20,
                                    boldFont: true,
                                    color: Colors.white,
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
                  color: Colors.yellowAccent,
                  thickness: 0.5,
                ),
                Row(
                  children: [
                    Container(
                      // color: Colors.black38,
                      margin: const EdgeInsets.only(left: 12, top: 12),
                      height: Get.height * 0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //Left
                        children: [
                          Container(
                            height: 120,
                            width: Get.width * 0.45,
                            color: Colors.black38,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            height: 75,
                            width: Get.width * 0.45,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.black38,
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
                            color: Colors.black38,
                            child: ComponentTextButton(
                              text: "Editar Perfil",
                              spaceBetweenIconAndText: 5,
                              mainAxisAlignment: MainAxisAlignment.center,
                              fontSize: 18,
                              iconSize: 26,
                              textColor: Colors.white,
                              iconColor: Colors.white,
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
                            color: Colors.black38,
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
