import 'package:flutter/material.dart';

TextField reuableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
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

Container signinSignupButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(isLogin ? 'LOGIN' : 'SIGNUP'),
    ),
  );
}
