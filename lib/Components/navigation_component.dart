import 'package:flutter/material.dart';

class BottomNavigationComponent extends StatefulWidget {
  const BottomNavigationComponent({super.key});

  @override
  State<BottomNavigationComponent> createState() =>
      _BottomNavigationComponentState();
}

class _BottomNavigationComponentState extends State<BottomNavigationComponent> {
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

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
          icon: Icon(Icons.code),
          label: "Home",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
          backgroundColor: Colors.blue,
        )
      ],
    );
  }
}
