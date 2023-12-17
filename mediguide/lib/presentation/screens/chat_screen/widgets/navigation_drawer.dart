import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediguide/controllers/auth.controller.dart';
import 'package:mediguide/presentation/screens/auth_screen/sign_in_screen.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/custom_chat_history_tile.dart';
import 'package:mediguide/presentation/widgets/settings.dart';
import 'package:mediguide/utils/theme_constants.dart';
import 'package:mediguide/utils/theme_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Chat {
  final String id;
  final String title;

  Chat({required this.id, required this.title});
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  Future<void> handleLogoutPressed(context) async {
    final ThemeData currentTheme = Theme.of(context);

    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            backgroundColor: currentTheme.appBarTheme.backgroundColor,
            title: const Text('Confirm Sign Out',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            content: const Text('Are you sure you want to sign out?',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 12)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 12)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Scaffold.of(context).closeDrawer();
                  AuthController.logout();
                  Fluttertoast.showToast(
                      msg: "You are now signed out",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.blueGrey,
                      textColor: Colors.white,
                      fontSize: 14.0);
                },
                child: const Text('Sign Out',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 12)),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);
    final FirebaseAuth auth = FirebaseAuth.instance;
    final List<Chat> chats = [
      // Chat(id: "asdfasdf", title: "Cancer Prognosis"),
      // Chat(id: "asdasdfasdf1", title: "Diabetes")
    ];

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
          Expanded(child: Builder(builder: (BuildContext context) {
            if (!AuthController.isAuthenticated()) {
              return const Center(
                  child: Text("Sign in to store chat history",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xFF858585))));
            } else if (chats.isEmpty) {
              return const Center(
                  child: Text("No chat history yet",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xFF858585))));
            }
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                itemCount: chats.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomChatHistoryTile(
                      title: chats[index].title,
                      onTap: () {
                        print("View ${chats[index].title}");
                      },
                      onDelete: () {
                        print("Delete ${chats[index].title}");
                      });
                });
          })),
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
                if (AuthController.isAuthenticated()) const SizedBox(height: 5),

                // Show User Profile when Signed In

                if (AuthController.isAuthenticated())
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(auth.currentUser!.displayName!,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              Text(auth.currentUser!.email!,
                                  style: const TextStyle(
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

                // Above widgets will only appear when user is signed in
                Visibility(
                    visible: AuthController.isAuthenticated(),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Divider(
                          height: 1,
                          color: ThemeUtils.getIconBackground(currentTheme),
                          thickness: 2,
                        ),
                        const SizedBox(height: 20),
                      ],
                    )),

                // Gap between the sign out & user profile
                // Sign In Button
                if (!AuthController.isAuthenticated())
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
                            style: TextStyle(
                                fontFamily: 'Poppins', fontSize: 12))),
                  )
                else
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
                          handleLogoutPressed(context);
                        },
                        child: const Text("Sign Out",
                            style: TextStyle(
                                fontFamily: 'Poppins', fontSize: 12))),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
