
import 'package:flutter/material.dart';
import 'package:mediguide/theme/theme_constants.dart';
import 'package:mediguide/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:mediguide/utils/theme_utils.dart';
import 'package:mediguide/custom_icons.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        toolbarHeight: 70,
        backgroundColor: currentTheme.appBarTheme.backgroundColor,
        leading: IconButton (
          color: ThemeUtils.foreground(currentTheme),
          icon: Container (
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration (
                  color: ThemeUtils.iconBackground(currentTheme),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0))
              ),
              child: const Icon(CustomIcons.ham, size: 20, color: accentColor)
          ), // The button to show the side drawer
          onPressed: () {
            // Add your logic to open the side drawer here
          },
        ),
        title: Center (
          child: Text(
            'New Chat', // The title of the app
            style: TextStyle(
              color: ThemeUtils.foreground(currentTheme),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 16
            ),
          ),
        ),
        actions: [
          // The dropdown icon on the right side
          Container(
            width: 75,
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              color: ThemeUtils.foreground(currentTheme),
              icon: const Icon(Icons.more_vert, color: Color(0xFFAFAFAF)),
              onPressed: () {
                // Add your logic for the dropdown here
              },
            ),
          ),
        ],
      )
      ,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Switch(
                value: themeManager.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeManager.toggleTheme();
                },
              ),
            ),
          ),
          const ChatInputSection(),
        ],
      ),
    );
  }
}



class ChatInputSection extends StatelessWidget {
  const ChatInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return Container(
      padding: const EdgeInsets.all(15.0),
      color: currentTheme.appBarTheme.backgroundColor, // Background color for the input section
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder (
                  borderSide: BorderSide(
                    color: ThemeUtils.iconBackground(currentTheme),
                    width: 2, // Set the desired border width
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'How are you feeling today?',
                hintStyle: const TextStyle (
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              ),
              style: const TextStyle (
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration (
              color: accentColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: lightForeground, size: 20),
              onPressed: () {
                // Add logic to send the message
              },
            ),
          ),
        ],
      ),
    );
  }
}
