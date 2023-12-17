import 'package:flutter/material.dart';

import 'package:mediguide/enums/menu_actions.dart';
import 'package:mediguide/presentation/widgets/settings.dart';
import 'package:mediguide/utils/custom_icons.dart';
import 'package:mediguide/utils/theme_constants.dart';
import 'package:mediguide/utils/theme_utils.dart';

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
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Center(
        child: Text(
          'MediGuide',
          style: TextStyle(
            color: ThemeUtils.getForeground(currentTheme),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
      actions: const [AppBarPopupMenu()],
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
              showSettingsDialog(context);
            }
          },
          offset: const Offset(0, 80),
          itemBuilder: (context) => [
                const PopupMenuItem(
                  value: MenuAction.deleteChat,
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text('Delete Chat', style: TextStyle(fontSize: 12)),
                ),
                const PopupMenuItem(
                  value: MenuAction.newChat,
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text('New Chat', style: TextStyle(fontSize: 12)),
                ),
                const PopupMenuItem(
                  value: MenuAction.settings,
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text('Settings', style: TextStyle(fontSize: 12)),
                ),
              ]),
    );
  }
}
