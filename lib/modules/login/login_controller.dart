import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class LoginController {
  final AuthController _authController = AuthController();

  Future<void> handleGoogleSignIn(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );

    try {
      final response = await _googleSignIn.signIn();
      final UserModel user = UserModel(
        name: response!.displayName!,
        photoURL: response.photoUrl,
      );

      _authController.setUser(context, user);
    } catch (err) {
      print(err);
    }
  }
}
