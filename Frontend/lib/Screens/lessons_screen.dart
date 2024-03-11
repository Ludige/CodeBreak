import 'package:flutter/material.dart';

import '../Components/custom_box_component.dart';
import '../Components/text_button_component.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});

  @override
  State<LessonsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LessonsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: Column(
            children: [
              ComponentCustomBox(
                child: ComponentTextButton(
                  text: "Iniciar lição",
                  icon: Icons.code_sharp,
                  iconColor: Colors.tealAccent,
                  onPressed: () {
                    //TODO
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
