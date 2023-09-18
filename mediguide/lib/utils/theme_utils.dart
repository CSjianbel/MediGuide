import 'package:flutter/material.dart';
import 'package:mediguide/utils/theme_constants.dart'; // Import your theme constants

class ThemeUtils {
  static ThemeData getTheme (BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    return themeMode == Brightness.dark ? darkTheme : lightTheme;
  }

  static Color getForeground (ThemeData currentTheme) {
    return currentTheme == lightTheme ? darkForeground : lightForeground;
  }

  static Color getIconBackground (ThemeData currentTheme) {
    return currentTheme == lightTheme ? iconLightBackground : iconDarkBackground;
  }

  static Color getShadowColor (ThemeData currentTheme) {
    return currentTheme == lightTheme ? shadowLight : shadowDark;
  }

  static Color getBorderColor (ThemeData currentTheme) {
    return currentTheme == lightTheme ? borderLight : borderDark;
  }
}
