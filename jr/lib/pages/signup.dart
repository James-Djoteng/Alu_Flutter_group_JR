import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jr/pages/booking_page.dart';
import 'package:jr/pages/homepage.dart';
import '../reusable_widgets/reusable_widget.dart';
import 'login_page.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({
    super.key,
  });

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  Future signUp() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailTextController.text.trim(),
      password: _passwordTextController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Sign up'),
                const SizedBox(
                  height: 20,
                ),
                reuableTextField('Enter Email', Icons.email_rounded, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reuableTextField('Enter Passwrod', Icons.password_rounded, true,
                    _passwordTextController),
                const SizedBox(
                    // height: 20,
                    ),
                signinSignupButton(context, false, signUp),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding signUpOption() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Already have an account? '),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: const Text('Signin'),
          )
        ],
      ),
    );
  }
}
