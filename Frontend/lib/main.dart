import 'package:duocode/Screens/hud.dart';
import 'package:duocode/Screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Misc/Themes/themes.dart';
import 'Misc/languages.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Code Break',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('pt', 'BR'),
      initialRoute: '/hud',
      routes: {
        //   '/splash': (context) => const ScreenSplash(),
        '/hud': (context) => const Hud(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
