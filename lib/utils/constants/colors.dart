import 'package:flutter/material.dart';

class TColors {
  const TColors._();

  // Brand Colors
  static const Color primary = Color(0xFF4A90E2);
  static const Color secondary = Color(0xFF737373);
  static const Color accent = Color(0xFFE3F2FD);

  // Text Colors
  static const Color textPrimary = Color(0xFF2D2D2D);
  static const Color textSecondary = Color(0xFF737373);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Colors.white;
  static const Color scaffoldBackground = Color(0xFFF8FAFC);
  static const Color primaryBackground = Color(0xFFF8FAFC);

  // Container Colors
  static const Color lightContainer = Color(0xFFF1F5F9);
  static const Color darkContainer = Color(0xFF334155);

  // Status Colors
  static const Color success = Color(0xFF388E3C);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Basic Colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color dark = Color(0xFF1E293B);
  static const Color light = Color(0xFFF8FAFC);

  // Grey Colors
  static const Color grey = Colors.grey;
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color paleGrey = Color(0xFFF9F9F9);
  static const Color darkGrey = Color(0xFF4A4A4A);
  static const Color darkerGrey = Color(0xFF4B4B4B);
  static const Color lightGrey = Color(0xFFE0E0E0);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF4868FF);
  static const Color buttonSecondary = Color(0xFF1E293B);
  static const Color buttonDisabled = Color(0xFFE2E8F0);
  static const Color disabledButton = Color(0xFFBDBDBD);

  // Border Colors
  static const Color borderPrimary = Color(0xFFE2E8F0);
  static const Color borderSecondary = Color(0xFFCBD5E1);

  // Misc Colors
  static const Color transparent = Colors.transparent;
  static const Color divider = Color(0xFFE0E0E0);
  static const Color shadow = Color(0x1F000000);
  static const Color overlay = Color(0x66000000);
  static const Color cardBackground = Colors.white;
  static const Color inputBackground = Color(0xFFF5F5F5);
  static const Color inputBorder = Color(0xFFE0E0E0);

  // Gradient
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF4868FF),
      Color(0xFF38BDF8),
    ],
  );
}
