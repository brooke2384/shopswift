import 'package:flutter/material.dart';

class TFabTheme {
  TFabTheme._();

  static final lightFabTheme = FloatingActionButtonThemeData(
    backgroundColor: Colors.blue[500],
    foregroundColor: Colors.white,
    elevation: 4,
    extendedPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    sizeConstraints: const BoxConstraints.tightFor(height: 56),
  );

  static const darkFabTheme = FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF2E6CA4),
    foregroundColor: Colors.white,
    elevation: 4,
    extendedPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    sizeConstraints: BoxConstraints.tightFor(height: 56),
  );
}
