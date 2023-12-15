import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jr/auth/auth_service.dart';
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
    final message = await AuthService().registration(
        email: _emailTextController.text,
        password: _passwordTextController.text);
    if (message!.contains('Success')) {
      Navigator.pushNamed(context, 'homePage');
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                reuableTextField(const Key('email'), 'Enter Email',
                    Icons.email_rounded, false, _emailTextController),
                const SizedBox(
                  height: 30,
                ),
                reuableTextField(const Key('password'), 'Enter Passwrod',
                    Icons.password_rounded, true, _passwordTextController),
                const SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: signUp,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 16, 20, 23),
                        borderRadius: BorderRadius.circular(7)),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                signInSingUpOption(context, true)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
