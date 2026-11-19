import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:module_6/service/auth/auth_service.dart';

class AuthNotifier with ChangeNotifier {
  final AuthService _authService = AuthService();

  // Loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> signUp(String email, String password) async {
    _setLoading(true);
    User? user = await _authService.signUp(email, password);
    _setLoading(false);
    return user != null;
  }

  Future<bool> signIn(String email, String password) async {
    _setLoading(true);
    User? user = await _authService.signIn(email, password);
    _setLoading(false);
    return user != null;
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
