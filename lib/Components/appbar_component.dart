import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Misc/Themes/themes.dart';
// import '../Misc/'; SharedPreferences

class ComponentAppBar extends StatefulWidget implements PreferredSizeWidget {
  // Function? onTap;

  const ComponentAppBar({super.key});

  @override
  State<ComponentAppBar> createState() => _ComponentAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _ComponentAppBarState extends State<ComponentAppBar> {
  // InstanceSharedPreference sharedPreferences = InstanceSharedPreference();
  Themes theme = Get.put(Themes());

  @override
  void initState() {
    // sharedPreferences.getThemeStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const SizedBox(
        child: Icon(
          Icons.access_time,
          color: Colors.white,
        ),
        // Image.asset("assets/image/logo.png", scale: 3),
      ),
    );
  }
}
