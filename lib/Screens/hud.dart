import 'package:flutter/material.dart';

import 'package:duocode/Components/navigation_component.dart';
import 'package:duocode/Screens/home_screen.dart';
import '../Components/appbar_component.dart';

class Hud extends StatefulWidget {
  const Hud({super.key});

  @override
  State<Hud> createState() => _HudState();
}

class _HudState extends State<Hud> {
  int currentIndex = 0;
  final screens = const [
    HomeScreen(),
  ];
  // IndexedStack no body pra mover entre paginas sem ele recarregar
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ComponentAppBar(),
        backgroundColor: Colors.white,
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationComponent(
          currentIndex: currentIndex,
        ),
      ),
    );
  }
}
