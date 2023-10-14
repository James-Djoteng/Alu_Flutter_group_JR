import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widget.dart';
import 'booking_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

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
                Text('Sign in'),
                SizedBox(
                  height: 20,
                ),
                reuableTextField('Enter Email', Icons.email_rounded, false,
                    _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reuableTextField('Enter Passwrod', Icons.password_rounded, true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signinSignupButton(context, true, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) => const MyForm());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
