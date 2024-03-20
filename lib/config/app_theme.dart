import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorApp = Color.fromARGB(255, 0, 98, 255);

  static Color colorAppAlpha = const Color.fromARGB(255, 0, 98, 128);

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorApp,
        fontFamily: 'Roboto',
      );
}
