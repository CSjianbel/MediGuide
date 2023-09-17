import 'package:flutter/material.dart';
import 'package:mediguide/presentation/screens/splash_screen.dart';
import 'package:mediguide/utils/theme_constants.dart';
import 'package:mediguide/utils/theme_manager.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider<ThemeManager>(
    create: (_) => ThemeManager(),
    child: const MyApp(),
  ),
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home: const SplashScreen()
    );
  }
}
