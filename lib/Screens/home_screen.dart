import 'package:flutter/material.dart';

import '../Components/appbar_component.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ComponentAppBar(),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
