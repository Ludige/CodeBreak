import 'package:duocode/Screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:duocode/Components/navigation_component.dart';
import 'package:duocode/Screens/home_screen.dart';
import 'package:get/get.dart';
import '../Components/appbar_component.dart';
import '../Misc/GetX/navigator_index.dart';

class Hud extends StatefulWidget {
  const Hud({super.key});

  @override
  State<Hud> createState() => _HudState();
}

class _HudState extends State<Hud> {
  NavigatorIndex currentIndex = Get.put(NavigatorIndex());
  final screens = const [
    ProfileScreen(),
    HomeScreen(),
  ];
  // IndexedStack no body pra mover entre paginas sem ele recarregar
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ComponentAppBar(),
        backgroundColor: Colors.white,
        body: Obx(() {
          return screens[currentIndex.index.value];
        }),
        bottomNavigationBar: const BottomNavigationComponent(),
      ),
    );
  }
}
