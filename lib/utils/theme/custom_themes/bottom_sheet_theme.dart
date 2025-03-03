import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: const BoxConstraints(minHeight: 400),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: const Color(0xFF1A1A1A),
    modalBackgroundColor: const Color(0xFF1A1A1A),
    constraints: const BoxConstraints(minHeight: 400),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
