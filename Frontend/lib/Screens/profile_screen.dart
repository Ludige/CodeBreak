import 'package:duocode/Components/button_w_text_component.dart';
import 'package:duocode/Components/custom_box_component.dart';
import 'package:duocode/Misc/Themes/customized_colors_global.dart';
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
                              top: 30, right: 16, left: 12),
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
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                ComponentCustomBox(
                                  height: 55,
                                  width: 13.5,
                                  backgroundColor: Colors.yellow,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                    margin: const EdgeInsets.only(left: 12, top: 12),
                    height: Get.height * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //Left
                      children: [
                        ComponentCustomBox(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 6, left: 12),
                                child: ComponentText(
                                  text: "Linguas",
                                  color: Colors.white,
                                  fontSize: 18,
                                  boldFont: true,
                                ),
                              ),
                              Container(
                                height: 60,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  separatorBuilder: (context, index) {
                                    // Space Between
                                    return const SizedBox(width: 6);
                                  },
                                  itemBuilder: (context, index) {
                                    return ComponentCustomBox(
                                      width: 12,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      backgroundColor: Colors.redAccent,
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        ComponentCustomBox(
                          margin: const EdgeInsets.only(top: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.black38,
                    height: Get.height * 0.3,
                    margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
                    child: Column(
                      //Right
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ComponentCustomBox(
                          child: ComponentTextButton(
                            text: "Editar Perfil",
                            icon: Icons.person,
                            iconColor: Colors.tealAccent,
                            onPressed: () {
                              //TODO
                            },
                          ),
                        ),
                        ComponentCustomBox(
                          margin: const EdgeInsets.only(top: 12),
                          child: ComponentTextButton(
                            text: "00 Dias",
                            icon: Icons.code,
                            iconColor: Colors.greenAccent,
                            onPressed: () {
                              //TODO
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
