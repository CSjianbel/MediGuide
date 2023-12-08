import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediguide/utils/theme_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../controllers/auth.controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  bool agreeToTerms = false;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> register(context) async {
    AuthResponse registerResponse = await AuthController.register(
        emailController.text.trim(),
        passwordController.text.trim(),
        fullNameController.text.trim()
    );

    if (registerResponse.success) {
      Navigator.pop(context);
    }
    else {
      print(registerResponse.message);
    }
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create an Account",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text("Provide your personal information",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Color(0xFFAFAFAF)))
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomInputField(
                      hint: "Enter your full name",
                      isPassword: false,
                      controller: fullNameController),
                  const SizedBox(height: 15),
                  CustomInputField(
                      hint: "Enter your email address",
                      isPassword: false,
                      controller: emailController),
                  const SizedBox(height: 15),
                  CustomInputField(
                      hint: "Create your password",
                      isPassword: true,
                      controller: passwordController),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text("I agree to the terms and conditions",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                        maxLines: 2),
                  ))
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (!agreeToTerms) return;
                        register(context);
                      },
                      child: const Text("Create Account",
                          style:
                              TextStyle(fontFamily: 'Poppins', fontSize: 12)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  const Text("Already have an account? ",
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 12)),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Sign In",
                          style:
                              TextStyle(fontFamily: 'Poppins', fontSize: 12)))
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
  final TextEditingController controller;

  const CustomInputField(
      {super.key,
      required this.hint,
      required this.isPassword,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = ThemeUtils.getTheme(context);

    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              width: 2, color: ThemeUtils.getBorderColor(currentTheme))),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
          ),
        ),
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
        ),
      ),
    );
  }
}
