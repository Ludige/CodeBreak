import 'package:duocode/Screens/lessons_screen.dart';
import 'package:duocode/Screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:duocode/Components/navigation_component.dart';
import 'package:get/get.dart';
import '../Misc/GetX/navigator_index.dart';

class Hud extends StatefulWidget {
  const Hud({super.key});

  @override
  State<Hud> createState() => _HudState();
}

class _HudState extends State<Hud> {
  NavigatorIndex currentIndex = Get.put(NavigatorIndex());
  final screens = const [
    LessonsScreen(),
    ProfileScreen(),
  ];
  // IndexedStack no body pra mover entre paginas sem ele recarregar
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return screens[currentIndex.index.value];
        }),
        bottomNavigationBar: const BottomNavigationComponent(),
      ),
    );
  }
}
