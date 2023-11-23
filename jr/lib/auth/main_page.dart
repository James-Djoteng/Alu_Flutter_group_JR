import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jr/pages/login_page.dart';
import 'package:jr/pages/signup.dart';
import '../pages/login_page.dart';

import '../pages/booking_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapchot) {
          if (snapchot.hasData) {
            return MyForm();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
