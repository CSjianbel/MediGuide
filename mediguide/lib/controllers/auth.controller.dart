import 'package:firebase_auth/firebase_auth.dart';

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
}