import 'package:flutter/material.dart';

final ahlTheme = ThemeData(
  // Define the default brightness and colors.
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.light,
  ),

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: const TextStyle(
      color: Colors.black,
      fontSize: 21,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
    bodySmall: const TextStyle(
      color: Colors.black,
      fontSize: 9,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w700,
    ),
  ),
);
