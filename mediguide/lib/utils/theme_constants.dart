import 'package:flutter/material.dart';

const Color lightForeground = Color(0xFFFEFEFE);
const Color darkForeground = Color(0xFF171F2A);
const Color accentColor = Color(0xFF1DA1F3);
const Color primaryLightBackground = Color(0xFFFEFEFE);
const Color primaryDarkBackground = Color(0xFF171F2A);
const Color secondaryLightBackground = Color(0xFFECECEC);
const Color secondaryDarkBackground = Color(0xFF17181D);
const Color iconDarkBackground = Color(0xFF1C2633);
const Color iconLightBackground = Color(0xFFF5F5F5);
const Color shadowDark = Color(0xFF0F1012);
const Color shadowLight = Color(0xFFA0A0A0);
const Color borderLight = Color(0xFFDBDBDB);
const Color borderDark = Color(0xFF1C2633);

ThemeData lightTheme = ThemeData (
    brightness: Brightness.light,
    scaffoldBackgroundColor: secondaryLightBackground,
    appBarTheme: const AppBarTheme (
        backgroundColor: primaryLightBackground,
    ),
);

ThemeData darkTheme = ThemeData (
    brightness: Brightness.dark,
    scaffoldBackgroundColor: secondaryDarkBackground,
    appBarTheme: const AppBarTheme (
        backgroundColor: primaryDarkBackground,
    ),
);