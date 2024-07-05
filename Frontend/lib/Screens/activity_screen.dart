import 'package:duocode/Components/button_component.dart';
import 'package:duocode/Components/text_button_component.dart';
import 'package:duocode/Misc/Themes/customized_colors_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ActivityScreen> {
  String texto = "abçdpsajdsajdkla\ndshajshdlahsdlas";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomizedColors.darkBackground,
        body: Column(
          children: [
            Row(
              children: [
                ComponentTextButton(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.amber,
                  onPressed: () {},
                ),
                // LinearProgressIndicator(
                //   value: 12,
                //   semanticsLabel: 'Linear progress indicator',
                // ),
              ],
            ),
            const Text(
              "",
              style: TextStyle(),
            ),
            // Expanded(
            //   child: Column(
            //       //Lissão
            //       // formatos depender da lissão
            //       ),
            // ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: ComponentButton(
                text: "Debugar",
                textStyle: const TextStyle(fontSize: 16),
                onPressed: () {},
                width: Get.width * 0.5,
                height: Get.height * 0.04,
              ),
            )
          ],
        ),
      ),
    );
  }
}
