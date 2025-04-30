import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> login() async {
    if (_email.isEmpty || _password.isEmpty) {
      throw Exception('Email and password cannot be empty');
    }

    _isLoading = true;
    notifyListeners();

    try {
      // Simulate a network call
      await Future.delayed(const Duration(seconds: 2));
      // Handle login logic here
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}