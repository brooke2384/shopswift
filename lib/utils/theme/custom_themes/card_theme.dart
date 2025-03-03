import 'package:flutter/material.dart';

class TCardTheme {
  TCardTheme._();

  static final lightCardTheme = CardTheme(
    elevation: 1,
    shadowColor: Colors.grey.withOpacity(0.2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    clipBehavior: Clip.antiAlias,
    margin: const EdgeInsets.all(8),
    color: Colors.white,
    surfaceTintColor: Colors.white,
  );

  static final darkCardTheme = CardTheme(
    elevation: 1,
    shadowColor: Colors.black.withOpacity(0.2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    clipBehavior: Clip.antiAlias,
    margin: const EdgeInsets.all(8),
    color: const Color(0xFF1A1A1A),
    surfaceTintColor: const Color(0xFF1A1A1A),
  );
}
