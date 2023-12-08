
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediguide/presentation/screens/auth_screen/sign_in_screen.dart';
import 'package:mediguide/presentation/screens/chat_screen/widgets/custom_chat_history_tile.dart';
import 'package:mediguide/presentation/widgets/settings.dart';
import 'package:mediguide/utils/theme_constants.dart';
import 'package:mediguide/utils/theme_utils.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

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

                if (user != null) Row(
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
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("",
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            Text(user.email!,
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
