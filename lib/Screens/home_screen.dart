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
    Center(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 50, color: Colors.black),
      ),
    ),
    Center(
      child: Text(
        "Profile",
        style: TextStyle(fontSize: 50, color: Colors.black),
      ),
    ),
  ];
  // IndexedStack no body pra mover entre paginas sem ele recarregar
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ComponentAppBar(),
        backgroundColor: Colors.white,
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.blue,
          iconSize: 32,
          selectedItemColor: const Color.fromARGB(255, 148, 240, 151),
          unselectedItemColor: const Color.fromARGB(255, 220, 250, 220),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
