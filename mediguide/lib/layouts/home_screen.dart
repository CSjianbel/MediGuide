
import 'package:flutter/material.dart';
import 'package:mediguide/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Switch(
          value: themeManager.themeMode == ThemeMode.dark,
          onChanged: (value) {
            themeManager.toggleTheme();
          },
        ),
      ),
    );
  }
}
