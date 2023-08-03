import 'package:duocode/Components/navigation_component.dart';
import 'package:flutter/material.dart';

import '../Components/appbar_component.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int currentIndex = 0;
  final screens = const [
    ScreenHome(),
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
