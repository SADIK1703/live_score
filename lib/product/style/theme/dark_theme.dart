import 'package:flutter/material.dart';
import 'package:live_score/product/_.export.dart';

ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: CustomColors.primary,
  scaffoldBackgroundColor: CustomColors.darkBackground,
  cardColor: CustomColors.darkCard,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: CustomColors.primary),
    bodyLarge: TextStyle(fontSize: 16, color: CustomColors.darkText),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: CustomColors.primary,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColors.primary,
      foregroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    ),
  ),
);
