import 'package:flutter/material.dart';

class BottomNavigationComponent extends StatefulWidget {
  int currentIndex;

  BottomNavigationComponent({
    super.key,
    this.currentIndex = 0,
  });

  @override
  State<BottomNavigationComponent> createState() =>
      _BottomNavigationComponentState();
}

class _BottomNavigationComponentState extends State<BottomNavigationComponent> {
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
      currentIndex: widget.currentIndex,
      onTap: (value) => setState(() {
        widget.currentIndex = value;
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
