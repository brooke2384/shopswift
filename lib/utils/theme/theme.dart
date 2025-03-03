import 'package:flutter/material.dart';
import 'custom_themes/text_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/card_theme.dart';
import 'custom_themes/animation_theme.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue[500],
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    textTheme: TTextTheme.lightTextTheme, // Apply text theme
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue[500]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue[700]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue[300]!),
      ),
    ),
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    pageTransitionsTheme: TAnimationTheme.pageTransitionsTheme,
    splashColor: Colors.blue.withOpacity(0.1),
    highlightColor: Colors.blue.withOpacity(0.05),
    dividerColor: Colors.grey[200],
    cardTheme: TCardTheme.lightCardTheme,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey[900],
      contentTextStyle: const TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      backgroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1A4B78),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1A4B78),
      secondary: Color(0xFF2E6CA4),
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    textTheme: TTextTheme.darkTextTheme, // Apply text theme
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF1A4B78)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF2E6CA4)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF15395C)),
      ),
    ),
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    pageTransitionsTheme: TAnimationTheme.pageTransitionsTheme,
    splashColor: const Color(0xFF2E6CA4).withOpacity(0.1),
    highlightColor: const Color(0xFF2E6CA4).withOpacity(0.05),
    dividerColor: Colors.grey[800],
    cardTheme: TCardTheme.darkCardTheme,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey[900],
      contentTextStyle: const TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      backgroundColor: const Color(0xFF1A1A1A),
    ),
  );
}
