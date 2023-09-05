import 'package:duocode/Components/button_component.dart';
import 'package:duocode/Misc/Themes/customized_colors_global.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: CustomizedColors.darkBackground,
          body: Column(
            children: [
              Row(
                children: [
                  ComponentButton(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.amber,
                    onPressed: () {},
                  )
                ],
              ),
              Container(
                  //Texto 1 o que fazer
                  ),
              Expanded(
                child: Column(
                    //Lissão
                    // formatos depender da lissão
                    ),
              ),
              ComponentButton(
                text: "Debugar",
                onPressed: () {},
              )
            ],
          )),
    );
  }
}
