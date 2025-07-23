import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFF96B6C5),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Roboto',
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: const Color(0xFF666666),
          fontSize: 32,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: const Color(0xFF666666),
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
