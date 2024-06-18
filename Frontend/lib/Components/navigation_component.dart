import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Misc/GetX/navigator_index.dart';

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
      selectedItemColor: Colors.purpleAccent,

      currentIndex: currentIndex.index.value,
      onTap: (value) => setState(() {
        currentIndex.index.value = value;
      }),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.code, color: Colors.purpleAccent),
          label: "Home",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.purpleAccent,
          ),
          label: "Profile",
          backgroundColor: Colors.white,
        )
      ],
    );
  }
}
