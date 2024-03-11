import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Misc/GetX/navigator_index.dart';
import '../Misc/Themes/pattern_colors.dart';

class BottomNavigationComponent extends StatefulWidget {
  const BottomNavigationComponent({super.key});

  @override
  State<BottomNavigationComponent> createState() =>
      _BottomNavigationComponentState();
}

class _BottomNavigationComponentState extends State<BottomNavigationComponent> {
  NavigatorIndex currentIndex = Get.put(NavigatorIndex());

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      // TODO >> transformar Cores e tamanhos em widget
      backgroundColor: Colors.blue,
      iconSize: 32,
      selectedItemColor: const Color.fromARGB(255, 148, 240, 151),
      unselectedItemColor: const Color.fromARGB(255, 220, 250, 220),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentIndex.index.value,
      onTap: (value) => setState(() {
        currentIndex.index.value = value;
      }),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.code, color: PatternColors.springGreen),
          label: "Home",
          backgroundColor: Color.fromARGB(255, 95, 95, 95),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: PatternColors.springGreen,
          ),
          label: "Profile",
          backgroundColor: Color.fromARGB(255, 95, 95, 95),
        )
      ],
    );
  }
}
