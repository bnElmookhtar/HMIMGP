import 'package:flutter/material.dart';
import 'package:hmimgp/src/constants/colors.dart';
import 'package:hmimgp/src/constants/lengths/fonts_size.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: deepBlue,
      centerTitle: true,
      foregroundColor: white,
    ),
    scaffoldBackgroundColor: offOrange,
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: small_2,
        color: white,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: medium,
        color: white,
      ),
      headlineLarge: TextStyle(
        fontSize: large,
        color: white,
        fontWeight: FontWeight.bold,
      ),
    )
  );
}