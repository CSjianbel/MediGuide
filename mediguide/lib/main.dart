import 'package:flutter/material.dart';
import 'package:mediguide/presentation/screens/splash_screen.dart';
import 'package:mediguide/utils/theme_constants.dart';
import 'package:mediguide/utils/theme_manager.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider<ThemeManager>(
      create: (_) => ThemeManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MediGuide',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeManager.themeMode,
        home: const SplashScreen());
  }
}
