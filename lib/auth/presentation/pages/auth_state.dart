import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instac/auth/presentation/pages/which_one.dart';
import 'package:instac/home/presentation/pages/main_page.dart';

class AuthStatePage extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  AuthStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MainPage();
        } else {
          return const WhichOne();
        }
      },
    );
  }
}
