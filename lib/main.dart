import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Misc/Themes/themes.dart';
import 'Misc/languages.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'RedeSocial',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('pt', 'BR'),
      initialRoute: '/home',
      routes: {
        //   '/splash': (context) => const ScreenSplash(),
        '/home': (context) => const ScreenHome(),
        //   "/register": (context) => const ScreenRegistration(),
        //   "/login": (context) => const ScreenLogin(),
        //   "/profile": (context) => const ScreenProfile(),
        //   "/setting": (context) => const ScreenSettings(),
        //   "/settingsPassword": (context) => const ScreenSettingsPassword(),
        //   "/createPost": (context) => const ScreenCreatePost(),
        //   "/teste": (context) => const Testes(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
