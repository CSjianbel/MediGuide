import 'package:flutter/material.dart';
import 'package:mediguide/utils/theme_constants.dart';
import '../../utils/theme_utils.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return Material(
      color: currentTheme.appBarTheme.backgroundColor,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 280.0,
            maxWidth: 500.0,
          ),
          padding: const EdgeInsets.all(25.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                  Container(
                    decoration: BoxDecoration (
                      color: ThemeUtils.getIconBackground(currentTheme),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: IconButton (
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_arrow_left, color: accentColor, size: 20),
                  ),
                ),
              ]
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Logo.png",
                    width: 50, height: 50, fit: BoxFit.fitWidth),
                const SizedBox(height: 15),
                Text("MediGuide",
                    style: TextStyle(
                        fontFamily: 'CarterOne',
                        color: ThemeUtils.getForeground(currentTheme),
                        fontSize: 20)),
                const Text("your medical companion",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFAFAFAF),
                      fontSize: 12,
                    ))
              ],
            ),
            const SizedBox(height: 50),
            const SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Text("Enter your email and password",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Color(0xFFAFAFAF)))
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomInputField(
                    inputIcon: Icons.email_outlined,
                    hint: 'Enter email address',
                    isPassword: false),
                SizedBox(height: 15),
                CustomInputField(
                    inputIcon: Icons.lock_outlined,
                    hint: 'Enter password',
                    isPassword: true),
                SizedBox(height: 10),
                Text("Forgot password?",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        color: Color(0xFFAFAFAF)))
              ],
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton (
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10),
                      ),
                    ),
                    onPressed: () {
                        // Sign In process here
                    },
                    child: const Text("Sign In", style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  height: 1,
                  color: ThemeUtils.getIconBackground(currentTheme),
                  thickness: 2,
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration (
                    border: Border.all(width: 2, color: accentColor),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ElevatedButton (
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0x00000000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10),
                      ),
                    ),
                    onPressed: () {
                      // Sign In process here
                    },
                    child: const Text("Create an Account", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: accentColor)),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final IconData inputIcon;
  final String hint;
  final bool isPassword;

  const CustomInputField({
    super.key,
    required this.inputIcon,
    required this.hint,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(0),
              ),
              border: Border(
                top: BorderSide(width: 2.0, color: ThemeUtils.getBorderColor(currentTheme)),
                right: BorderSide(width: 0, color: ThemeUtils.getBorderColor(currentTheme)),
                bottom: BorderSide(width: 2.0, color: ThemeUtils.getBorderColor(currentTheme)),
                left: BorderSide(width: 2.0, color: ThemeUtils.getBorderColor(currentTheme)),
              ),
            ),
            child:
                Icon(inputIcon, color: ThemeUtils.getForeground(currentTheme)),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  border: Border(
                    top: BorderSide(width: 2.0, color: ThemeUtils.getBorderColor(currentTheme)),
                    right: BorderSide(width: 2.0, color: ThemeUtils.getBorderColor(currentTheme)),
                    bottom: BorderSide(width: 2.0, color: ThemeUtils.getBorderColor(currentTheme)),
                    left: BorderSide(width: 2.0, color: ThemeUtils.getBorderColor(currentTheme)),
                  ),
                ),
                child: TextFormField(
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
