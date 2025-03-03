import 'package:flutter/material.dart';

class TListTileTheme {
  TListTileTheme._();

  static ListTileThemeData lightListTileTheme = const ListTileThemeData(
    iconColor: Colors.black87,
    textColor: Colors.black87,
    titleTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    subtitleTextStyle: TextStyle(
      fontSize: 14,
      color: Colors.grey,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );

  static ListTileThemeData darkListTileTheme = const ListTileThemeData(
    iconColor: Colors.white70,
    textColor: Colors.white70,
    titleTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
    ),
    subtitleTextStyle: TextStyle(
      fontSize: 14,
      color: Colors.grey,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );
}
