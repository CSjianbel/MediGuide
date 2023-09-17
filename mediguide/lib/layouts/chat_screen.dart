
import 'package:flutter/material.dart';
import 'package:mediguide/enums/menu_actions.dart';
import 'package:mediguide/theme/theme_constants.dart';
import 'package:mediguide/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:mediguide/utils/theme_utils.dart';
import 'package:mediguide/utils/custom_icons.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(),
      ),
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


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return AppBar(
      leadingWidth: 75,
      toolbarHeight: 70,
      backgroundColor: currentTheme.appBarTheme.backgroundColor,
      leading: IconButton(
        color: ThemeUtils.getForeground(currentTheme),
        icon: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ThemeUtils.getIconBackground(currentTheme),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: const Icon(CustomIcons.ham, size: 20, color: accentColor),
        ),
        onPressed: () {
          // Add your logic to open the side drawer here
        },
      ),
      title: Center(
        child: Text(
          'New Chat', // The title of the app
          style: TextStyle(
            color: ThemeUtils.getForeground(currentTheme),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      actions: const [
        AppBarPopupMenu()
      ],
    );
  }
}


class AppBarPopupMenu extends StatelessWidget {
  const AppBarPopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return Container(
      width: 75,
      padding: const EdgeInsets.only(left: 16.0),
      child: PopupMenuButton<MenuAction>(
          color: currentTheme.appBarTheme.backgroundColor,
          icon: const Icon(Icons.more_vert, color: Color(0xFFAFAFAF)),
          onSelected: (value) {
            if (value == MenuAction.deleteChat) {
              // perform action to delete chat
            }
            if (value == MenuAction.newChat) {
              // perform action to create new chat
            }
            if (value == MenuAction.settings) {
              // perform action to show settings
            }
          },
          offset: const Offset(0, 80),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: MenuAction.deleteChat,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Delete Chat', style: TextStyle(fontSize: 14)),
            ),
            const PopupMenuItem(
              value: MenuAction.newChat,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('New Chat', style: TextStyle(fontSize: 14)),
            ),
            const PopupMenuItem(
              value: MenuAction.settings,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Settings', style: TextStyle(fontSize: 14)),
            ),
          ]),
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
                    color: ThemeUtils.getIconBackground(currentTheme),
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
