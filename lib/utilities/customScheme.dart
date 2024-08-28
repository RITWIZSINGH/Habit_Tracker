// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF3498db);
  static const Color accentColor = Color(0xFF2ecc71);
  static const Color surfaceColor = Color(0xFFecf0f1);
  static const Color textColor = Color(0xFF2c3e50);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      surface: surfaceColor,
    ),
    scaffoldBackgroundColor: surfaceColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: textColor),
      bodyLarge: TextStyle(color: textColor),
    ),
    iconTheme: IconThemeData(color: primaryColor),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Color(0xFF2c3e50),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF2c3e50),
      secondary: Color(0xFF27ae60),
      surface: Color.fromARGB(255, 105, 143, 181),
    ),
    scaffoldBackgroundColor: Color(0xFF34495e),
    appBarTheme: AppBarTheme(
      color: Color(0xFF2c3e50),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(color: Color(0xFF3498db)),
  );
}