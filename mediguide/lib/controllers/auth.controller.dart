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
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return AuthResponse(success: true, message: 'Successfully logged in!');
      }

      return AuthResponse(success: false, message: "Invalid email or password. Please try again.");

    } catch (e) {
      // Handle sign-up failure
      String message;
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-email':
            message = "Invalid email address.";
            break;
          case 'invalid-credential':
            message = "Login credentials doesn't match any records.";
            break;
          default:
            message = "Invalid login credential.";
            break;
        }
      }
      else {
        message = "Something went wrong. Please try again later.";
      }
      return AuthResponse(success: false, message: message);
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
        await userCredential.user!.updateDisplayName(fullName);
        return AuthResponse(success: true, message: "Account created successfully!");
      }

      return AuthResponse(success: false, message: "Account creation failed. Try again later.");

    } catch (e) {
      // Handle sign-up failure
      String message;
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'email-already-in-use':
            message = "An account already exists with the given email address.";
            break;
          case 'invalid-email':
            message = "Invalid email address.";
            break;
          case 'weak-password':
            message = "Password is too weak.";
            break;
          default:
            message = "Something went wrong. Please try again later.";
            break;
        }
      }
      else {
        message = "Something went wrong. Please try again later.";
      }
      return AuthResponse(success: false, message: message);
    }
  }

  static Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      // Handle sign-out errors
      print('Error signing out: $e');
    }
  }

  static bool isAuthenticated() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    return user != null;
  }
}