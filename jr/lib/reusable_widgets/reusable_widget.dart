import 'package:flutter/material.dart';

GestureDetector signInSingUpOption(BuildContext context, bool state) {
  return GestureDetector(
    onTap: () {
      if (state) {
        Navigator.pushNamed(context, 'login');
      } else {
        Navigator.pushNamed(context, 'signUp');
      }
      ;
    },
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account? '),
          Text(state ? 'SignIn' : 'SignUp'),
        ],
      ),
    ),
  );
}

TextField reuableTextField(Key myKey, String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextField(
    key: myKey,
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: isPasswordType,
    autocorrect: isPasswordType,
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      labelText: text,
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

InkWell signinSignupButton(BuildContext context, bool isLogin, Function onTap) {
  return InkWell(
    onTap: null,
    child: Container(
      width: 100,
      height: 50,
      color: Colors.blue,
      child: Center(
        child: Text(isLogin ? 'Sign in' : 'Sign Up'),
      ),
    ),
  );
}

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
  ),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}
