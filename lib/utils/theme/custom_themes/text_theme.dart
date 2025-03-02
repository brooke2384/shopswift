import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._(); // Private constructor to prevent instantiation

  static const TextStyle _baseStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static TextTheme lightTextTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: lightTextTheme.headlineLarge!.copyWith(color: Colors.white),
    headlineMedium: lightTextTheme.headlineMedium!.copyWith(color: Colors.white70),
    bodyLarge: lightTextTheme.bodyLarge!.copyWith(color: Colors.white70),
    labelLarge: lightTextTheme.labelLarge,
    bodyMedium: lightTextTheme.bodyMedium!.copyWith(color: Colors.grey[400]),
  );
}
