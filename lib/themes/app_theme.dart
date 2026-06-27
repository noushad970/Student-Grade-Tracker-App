import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.green,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSurface: Colors.black,
    ),

    appBarTheme: const AppBarTheme(centerTitle: true),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    colorScheme: const ColorScheme.dark(
      primary: Colors.lightBlue,
      secondary: Colors.greenAccent,
      surface: Color(0xFF1E1E1E),
      onPrimary: Colors.black,
      onSurface: Colors.white,
    ),

    appBarTheme: const AppBarTheme(centerTitle: true),
  );
}
