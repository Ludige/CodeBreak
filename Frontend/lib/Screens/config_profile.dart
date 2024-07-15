import 'dart:io';

import 'package:duocode/Misc/GetX/logged_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/text_button_component.dart';
import '../Components/text_edit_component.dart';

class ConfigProfileScreen extends StatefulWidget {
  const ConfigProfileScreen({super.key});

  @override
  State<ConfigProfileScreen> createState() => _ConfigProfileScreenState();
}

class _ConfigProfileScreenState extends State<ConfigProfileScreen> {
  //TODO Adicionar login para salvar
  // String? urlImageProfile = LoggedProfile().profile.value.image;
  // File? _image;
  LoggedProfile profile = Get.put(LoggedProfile());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.purple),
        title: const Text(
          "Perfil",
          style: TextStyle(color: Colors.purple),
        ),
        elevation: 0,
        toolbarHeight: 42,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(color: Colors.purple),
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 12),
              //Foto de perfil
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: Border.all(
                  color: Colors.purple,
                ),
              ),
              child: ComponentTextButton(
                icon: Icons.add_a_photo_outlined,
                iconColor: Colors.purple,
                iconSize: 25,
                onPressed: () {},
              ),
            ),
            ComponentEditText(
              text: "Nome",
            ),
            ComponentEditText(
              text: "Email",
            ),
          ],
        ),
      ),
    );
  }
}
