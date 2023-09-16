import 'package:flutter/material.dart';
import 'package:mediguide/theme/theme_constants.dart'; // Import your theme constants

class ThemeUtils {
  static ThemeData getTheme(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    return themeMode == Brightness.dark ? darkTheme : lightTheme;
  }
}
