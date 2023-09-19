import 'package:flutter/material.dart';
import 'package:mediguide/utils/theme_manager.dart';
import 'package:provider/provider.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  SettingsDialogState createState() => SettingsDialogState();
}

class SettingsDialogState extends State<SettingsDialog> {

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);
    final themeManager = Provider.of<ThemeManager>(context);

    return AlertDialog(
      backgroundColor: currentTheme.appBarTheme.backgroundColor,
      title: Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            decoration: const BoxDecoration (
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Settings', style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    icon: const Icon(Icons.close, color:  Color(0xFFAFAFAF))
                )
              ]
          ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Toggle Theme', style: TextStyle(fontFamily: 'Poppins', fontSize: 12)),
              Switch(
                value: themeManager.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeManager.toggleTheme();
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Delete Data', style: TextStyle(fontFamily: 'Poppins', fontSize: 12)),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFF5959))
                ),
                onPressed: () {
                  // Handle delete data logic here
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('Delete', style: TextStyle(fontFamily: 'Poppins')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


void showSettingsDialog(BuildContext outerContext) {
  showDialog(
    context: outerContext,
    builder: (BuildContext context) {
      return const SettingsDialog(); // Use the SettingsDialog widget
    },
  );
}

