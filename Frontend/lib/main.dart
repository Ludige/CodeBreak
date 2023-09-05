import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/activity_screen.dart';
import 'Screens/lessons_screen.dart';
import 'Screens/profile_screen.dart';
import 'Screens/hud.dart';

import 'Misc/Themes/themes.dart';
import 'Misc/languages.dart';

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
      initialRoute: '/activity',
      routes: {
        //   '/splash': (context) => const ScreenSplash(),
        '/hud': (context) => const Hud(),
        '/home': (context) => const LessonsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/activity': (context) => const ActivityScreen(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
