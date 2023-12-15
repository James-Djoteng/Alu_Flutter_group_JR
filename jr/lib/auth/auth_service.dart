import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jr/pages/login_page.dart';
import 'package:jr/pages/signup.dart';

import '../pages/booking_page.dart';

class AuthService {
  Future<String?> registration({required email, required password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'Password is weak';
      } else if (e.code == 'email-already-in-use') {
        return 'An account already exists for this email';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({required email, required password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for this email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong Password provided for this user';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
