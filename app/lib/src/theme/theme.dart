import 'package:flutter/material.dart';

const COLOR_PRIMARY = Color(0xFFFF8730);
const COLOR_SECONDARY = Color(0xFFF4EBDC);
const COLOR_TEXT = Color(0xFF000000);

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: COLOR_PRIMARY,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: COLOR_PRIMARY),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}
