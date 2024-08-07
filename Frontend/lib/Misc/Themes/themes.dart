import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customized_colors_global.dart';

class Themes extends GetxController {
  RxBool isLightTheme = false.obs;

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: CustomizedColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: CustomizedColors.darkBackground,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0.5,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    drawerTheme: DrawerThemeData(
      backgroundColor: CustomizedColors.darkBackground,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.cyan,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0.5,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
  );
}
