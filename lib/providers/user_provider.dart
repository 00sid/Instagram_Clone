import 'package:flutter/material.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User? get getUser => _user;

  final AuthMethod _authMethod = AuthMethod();

  Future<void> refreshUser() async {
    _user = await _authMethod.getUserDetails();
    notifyListeners();
  }
}
