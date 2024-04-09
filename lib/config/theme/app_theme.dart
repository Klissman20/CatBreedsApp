import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorApp = Color.fromARGB(255, 119, 158, 247);

  static Color colorAppAlpha = const Color.fromARGB(255, 0, 98, 128);

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorApp,
        fontFamily: 'Roboto',
      );
}
