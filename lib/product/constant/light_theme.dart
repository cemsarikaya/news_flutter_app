import 'package:flutter/material.dart';

class LighTheme {
  late ThemeData theme;

  LighTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Color.fromARGB(255, 51, 73, 196),
            titleTextStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
        colorScheme: const ColorScheme.light(),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 51, 73, 196),
                minimumSize: const Size(60, 50),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))));
  }
}
