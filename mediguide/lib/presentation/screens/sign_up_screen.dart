import 'package:flutter/material.dart';
import '../../utils/theme_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return Material(
      color: currentTheme.appBarTheme.backgroundColor,
      child: Center (
        child: Container (
          constraints: const BoxConstraints(
            minWidth: 280.0,
            maxWidth: 500.0,
          ),
          padding: const EdgeInsets.all(25.0),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create an Account", style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("Provide your personal information", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, color: Color(0xFFAFAFAF)))
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomInputField(hint: "Enter your full name", isPassword: false),
                  SizedBox(height: 15),
                  CustomInputField(hint: "Enter your email address", isPassword: false),
                  SizedBox(height: 15),
                  CustomInputField(hint: "Create your password", isPassword: true),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: BorderSide(
                          color: ThemeUtils.getForeground(currentTheme),
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Checkbox(
                      value: agreeToTerms,
                      onChanged: (bool? newValue) {
                        setState(() {
                          agreeToTerms = newValue ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text("I agree to the terms and conditions", style: TextStyle(fontFamily: 'Poppins', fontSize: 12), maxLines: 2),
                ],
              ),
              const SizedBox(height: 20),
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
                      onPressed: agreeToTerms ? () {
                        // Handle sign up process here
                      } : null,
                      child: const Text("Create Account", style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  const Text("Already have an account? ", style: TextStyle(fontFamily: 'Poppins')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Sign In", style: TextStyle(fontFamily: 'Poppins'))
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class CustomInputField extends StatelessWidget {
  final String hint;
  final bool isPassword;

  const CustomInputField({
    super.key,
    required this.hint,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 2, color: ThemeUtils.getBorderColor(currentTheme))
      ),
      child: TextFormField (
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
      ),
    );
  }
}
