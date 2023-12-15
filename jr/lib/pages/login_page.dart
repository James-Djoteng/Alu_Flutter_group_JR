import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../auth/auth_service.dart';
import '../reusable_widgets/reusable_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  Future signIn() async {
    final message = await AuthService().login(
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

  /*void signInWithGoogle() async {
    // Debug print statement indicating that the function has been invoked.
    print('I am here');

    // Initialize Firebase Authentication
    FirebaseAuth auth = FirebaseAuth.instance;

    // Create a GoogleSignIn instance
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // Initiate the Google Sign-In process
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Check if the Google Sign-In process was canceled
    if (googleUser == null) {
      // The user canceled the sign-in process
      print('Google Sign-In canceled.');
      return;
    }

    // Retrieve authentication details from the signed-in Google user
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create an AuthCredential using the Google Sign-In authentication details
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in with Firebase Authentication using the AuthCredential
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);

    // Print the display name of the signed-in user to the console
    print('User Display Name: ${userCredential.user?.displayName}');

    // Debug print statement indicating that the sign-in process has finished
    print('Finished routing');
    Navigator.pushNamed(context, 'booking');

    // The function returns null (you might modify this based on your requirements)
    return null;
  }*/

  void signInWithGoogle() async {
    // Debug print statement indicating that the function has been invoked.
    print('I am here');

    // Initialize Firebase Authentication
    FirebaseAuth auth = FirebaseAuth.instance;

    // Create a GoogleSignIn instance with the client ID
    final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId:
            '627611705374-8e3uo6q84r01jjom00dj1s86j66rhr7j.apps.googleusercontent.com');

    // Initiate the Google Sign-In process
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Check if the Google Sign-In process was canceled
    if (googleUser == null) {
      // The user canceled the sign-in process
      print('Google Sign-In canceled.');
      return;
    }

    // Retrieve authentication details from the signed-in Google user
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create an AuthCredential using the Google Sign-In authentication details
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in with Firebase Authentication using the AuthCredential
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);

    // Print the display name of the signed-in user to the console
    print('User Display Name: ${userCredential.user?.displayName}');

    // Debug print statement indicating that the sign-in process has finished
    print('Finished routing');

    // The function returns null (you might modify this based on your requirements)
    return null;
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
                Text(
                  'Sign In',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                reuableTextField(const Key('email'), 'Enter Email',
                    Icons.email_rounded, false, _emailTextController),
                SizedBox(
                  height: 20,
                ),
                reuableTextField(const Key('password'), 'Enter Passwrod',
                    Icons.password_rounded, true, _passwordTextController),
                SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: signIn,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 16, 20, 23),
                        borderRadius: BorderRadius.circular(7)),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: const Center(
                      child: Text('Sign in',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign In with:'),
                    GestureDetector(
                      onTap: () {
                        signInWithGoogle();
                        Navigator.pushNamed(context, 'booking');
                      },
                      child: Container(
                        height: 60,
                        child: Image.asset(
                            '/Users/pro/Alu_Flutter_group_JR/jr/assets/images/google.png'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                signInSingUpOption(context, false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
