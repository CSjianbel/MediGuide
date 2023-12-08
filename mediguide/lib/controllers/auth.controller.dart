import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthResponse {
  final bool success;
  final String message;
  AuthResponse({required this.success, required this.message});
}

class AuthController {
  static Future<AuthResponse> login(email, password) async {
    try {
      print('Logging in!!!');
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return AuthResponse(success: true, message: 'Successfully logged in!');
      }

      return AuthResponse(success: false, message: "Credentials doesn't match!");

    } catch (e) {
      // Handle sign-up failure
      print(e.toString());
      return AuthResponse(success: false, message: "Something went wrong.");
    }
  }

  static Future<AuthResponse> register(email, password, fullName) async {
    try {
      print('REGISTERING USER!!!');
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Store full name in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({'fullName': fullName});

        return AuthResponse(success: true, message: "Account created successfully!");
      }

      return AuthResponse(success: false, message: "Account creation failed.");

    } catch (e) {
      // Handle sign-up failure
      print(e.toString());
      return AuthResponse(success: false, message: "Something went wrong.");
    }
  }
}