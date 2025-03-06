import 'package:flutter/material.dart';
import 'package:live_score/product/_.export.dart';

ThemeData appLightTheme = ThemeData(
  primaryColor: CustomColors.primaryColor,
  scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: CustomColors.textColor),
    bodyMedium: TextStyle(color: CustomColors.textColor),
    displayLarge: TextStyle(color: CustomColors.white),
    displayMedium: TextStyle(color: CustomColors.white),
  ),
  iconTheme: const IconThemeData(
    color: CustomColors.iconColor,
    size: 24.0,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: CustomColors.accentColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    textTheme: ButtonTextTheme.primary,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: CustomColors.accentColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: CustomColors.iconColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: CustomColors.highlightColor),
    ),
  ),
  appBarTheme: AppBarTheme(
    color: CustomColors.appBarColor,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: CustomColors.iconColor,
    ),
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(
        color: CustomColors.textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(
        color: CustomColors.textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ).titleLarge,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: CustomColors.accentColor),
);
