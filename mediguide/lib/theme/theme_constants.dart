import 'package:flutter/material.dart';

const Color lightForeground = Color(0xFFFEFEFE);
const Color darkForeground = Color(0xFF171F2A);
const Color accentColor = Color(0xFF1DA1F3);
const Color primaryLightBackground = Color(0xFFFEFEFE);
const Color primaryDarkBackground = Color(0xFF171F2A);
const Color secondaryLightBackground = Color(0xFFECECEC);
const Color secondaryDarkBackground = Color(0xFF17181D);

ThemeData lightTheme = ThemeData (
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
);

ThemeData darkTheme = ThemeData (
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF171F2A),
);