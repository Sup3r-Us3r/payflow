import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;
  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) async {
    if (user != null) {
      _user = user;

      await saveUser(user);

      Navigator.pushReplacementNamed(context, '/home', arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUser(UserModel user) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    await _prefs.setString('@payflow/userData', user.toJson());
  }

  Future<void> getUser(BuildContext context) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 2));

    if (_prefs.containsKey('@payflow/userData')) {
      final json = _prefs.get('@payflow/userData') as String;

      return setUser(context, UserModel.fromJson(json));
    } else {
      return setUser(context, null);
    }
  }
}
