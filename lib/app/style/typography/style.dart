import 'package:auth_app/app/style/color/color.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData _themeData = ThemeData(
      hoverColor: CustomColor.primary,
      focusColor: CustomColor.primary,
      colorScheme: ColorScheme.fromSeed(seedColor: CustomColor.primary),
      useMaterial3: true,
      textTheme: const TextTheme(),
      primaryColor: CustomColor.primary,
      appBarTheme: const AppBarTheme(
        color: CustomColor.primary,
        titleTextStyle: TextStyle(
            color: CustomColor.white, fontSize: 20, fontWeight: FontWeight.bold),
        surfaceTintColor: Colors.transparent,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: CustomColor.primary));

  static ThemeData get themLight => _themeData;
}
