import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:mediguide/enums/menu_actions.dart';
import 'package:mediguide/presentation/screens/sign_in_screen.dart';
import 'package:mediguide/utils/theme_constants.dart';
// import 'package:mediguide/utils/theme_manager.dart';
import 'package:mediguide/utils/theme_utils.dart';
import 'package:mediguide/utils/custom_icons.dart';
import 'package:mediguide/presentation/widgets/settings.dart';
import 'package:mediguide/presentation/widgets/user_chat_bubble.dart';
import 'package:mediguide/presentation/widgets/bot_chat_bubble.dart';
import 'package:mediguide/presentation/widgets/chat_input_section.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15.0),
              children: const <Widget>[
                BotChatBubble(
                    message:
                        "Hi! I am MediGuide. How can I assist you today? If you're not feeling your best, just let me know your symptoms, and I'll do my best to provide you with some insights. Remember, I'm here to help, but for accurate medical advice, always consult a healthcare professional."),
                UserChatBubble(
                    message: "shivering, chills, joint pain, headache"),
                BotChatBubble(
                    message:
                        "Based on your symptoms, you might have gastroenteritis. Gastroenteritis is a short-term illness triggered by the infection and inflammation of the digestive system."),
                UserChatBubble(
                    message: "shivering, chills, joint pain, headache"),
                BotChatBubble(
                    message:
                        "Based on your symptoms, you might have gastroenteritis. Gastroenteritis is a short-term illness triggered by the infection and inflammation of the digestive system.")
              ],
            ),
          ),
          const ChatInputSection(),
        ],
      ),
      drawer: const NavigationDrawer(),
    );
  }
}


class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return Drawer(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              color: currentTheme.appBarTheme.backgroundColor,
              boxShadow: [
                BoxShadow(
                    color: ThemeUtils.getShadowColor(currentTheme),
                    offset: const Offset(0, 2),
                    blurRadius: 4),
              ],
            ),
            width: double.infinity,
            height: 70,
            child: Row(children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/Logo.png",
                        width: 35, height: 35, fit: BoxFit.fitWidth),
                    const SizedBox(width: 20),
                    Text("MediGuide",
                        style: TextStyle(
                            fontFamily: 'CarterOne',
                            color: ThemeUtils.getForeground(currentTheme),
                            fontSize: 16))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ThemeUtils.getIconBackground(currentTheme),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
                child: IconButton(
                  color: ThemeUtils.getForeground(currentTheme),
                  icon: const Icon(Icons.keyboard_arrow_left,
                      size: 20, color: accentColor),
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                ),
              ),
            ]),
          ),
          Expanded(
            child:
                // Show chat history
                ListView(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              children: <Widget>[
                CustomChatHistoryTile(
                  title: "Cancer Prognosis",
                  onTap: () {
                    print("view this prognosis");
                  },
                  onDelete: () {
                    print("delete this prognosis");
                  },
                ),
                CustomChatHistoryTile(
                  title: "tuberculosis Prognosis",
                  onTap: () {
                    print("view this prognosis");
                  },
                  onDelete: () {
                    print("delete this prognosis");
                  },
                ),
                CustomChatHistoryTile(
                  title: "Diabetes Prognosis",
                  onTap: () {
                    print("view this prognosis");
                  },
                  onDelete: () {
                    print("delete this prognosis");
                  },
                ),
                CustomChatHistoryTile(
                  title: "Possible Remedies for tuberculosis",
                  onTap: () {
                    print("view this prognosis");
                  },
                  onDelete: () {
                    print("delete this prognosis");
                  },
                ),
              ],
            ),

            // Show this widget when there is no chat history yet
            // Center(
            //  child: Text("No chat history yet", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Color(0xFF858585)))
            // )

            // Show this widget when user is not signed in
            // Center(
            //     child: Text("Sign in to store chat history", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Color(0xFF858585)))
            // )
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            width: double.infinity,
            decoration: BoxDecoration(
                color: currentTheme.appBarTheme.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: ThemeUtils.getShadowColor(currentTheme),
                    offset: const Offset(0, -1),
                    blurRadius: 4,
                  ),
                ]),
            child: Column(
              children: [
                // Below widgets will only appear when user is signed in
                const SizedBox(height: 5),

                // Show User Profile when Signed In
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: accentColor, // Set the border color
                              width: 1, // Set the border width
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/sample_user_picture.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("JOHN DOE",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            Text("email@gmail.com",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                    color: Color(0xFF858585)))
                          ],
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          showSettingsDialog(context);
                        },
                        icon: const Icon(Icons.settings,
                            color: Color(0xFFAFAFAF)))
                  ],
                ),

                const SizedBox(height: 20),

                // Above widgets will only appear when user is signed in

                Divider(
                  height: 1,
                  color: ThemeUtils.getIconBackground(currentTheme),
                  thickness: 2,
                ),

                // Gap between the sign out & user profile
                const SizedBox(height: 20),

                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      child: const Text("Sign In",
                          style:
                              TextStyle(fontFamily: 'Poppins', fontSize: 12))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class CustomChatHistoryTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const CustomChatHistoryTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                // Your onPressed logic here
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: Row(
                children: [
                  Icon(Icons.message_outlined, size: 14, color: ThemeUtils.getForeground(currentTheme),),
                  const SizedBox(width: 10.0), // Adjust spacing as needed
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: ThemeUtils.getForeground(currentTheme)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // delete button onPressed logic here
            },
            icon: const Icon(Icons.delete_outline_outlined, size: 14, color: Color(0xFFFF5959)),
          )
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
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Center(
        child: Text(
          'New Chat',
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
