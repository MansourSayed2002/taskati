import 'package:flutter/material.dart';
import 'package:taskati/core/theme/color_app.dart';

class ThemeApp {
  static ThemeData themeLight = ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: ColorApp.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorApp.primary,
      onSurface: ColorApp.dark,
    ),
    iconTheme: IconThemeData(color: ColorApp.dark),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorApp.white,
      iconTheme: IconThemeData(color: ColorApp.dark),
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: ColorApp.dark,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  static ThemeData themeDark = ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: ColorApp.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorApp.primary,
      onSurface: ColorApp.white,
    ),
    iconTheme: IconThemeData(color: ColorApp.white),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorApp.dark,
      iconTheme: IconThemeData(color: ColorApp.primary),
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: ColorApp.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
