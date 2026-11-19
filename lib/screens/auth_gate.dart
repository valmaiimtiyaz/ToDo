import 'package:flutter/material.dart';
import 'package:module_6/screens/sign_in_screen.dart';

import '../service/auth/auth_service.dart';
import 'todo_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return StreamBuilder(
      stream: _auth.authStateChange,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TodoScreen();
        } else {
          return SignInScreen();
        }
      },
    );
  }
}
