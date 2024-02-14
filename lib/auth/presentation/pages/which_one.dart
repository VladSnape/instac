import 'package:flutter/material.dart';
import 'package:instac/auth/presentation/pages/login.dart';
import 'package:instac/auth/presentation/pages/signup.dart';

class WhichOne extends StatefulWidget {
  const WhichOne({super.key});

  @override
  State<WhichOne> createState() => _WhichOneState();
}

class _WhichOneState extends State<WhichOne> {
  bool login = false;
  void toggleLogin() {
    setState(() {
      login = !login;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (login) {
      return LoginPage(
        toggle: toggleLogin,
      );
    } else {
      return SignUpPage(
        toggle: toggleLogin,
      );
    }
  }
}
