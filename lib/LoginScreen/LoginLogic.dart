import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madgains/Components/MainScreens.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool islogEmailEmpty = false;
bool islogPasswordEmpty = false;

void login(BuildContext context) async {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();
  islogEmailEmpty = email.isEmpty;
  islogPasswordEmpty = password.isEmpty;

  if (islogEmailEmpty || islogPasswordEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter both email and password.')),
    );
    (context as Element).markNeedsBuild();
    return;
  }

  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    print("User logged in: ${userCredential.user?.email}");
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainScreens()),
    );

  } on FirebaseAuthException catch (e) {
    String errorMessage;

    switch (e.code) {
      case 'user-not-found':
        errorMessage =
            'No user found for that email. Please check your email or register.';
        break;
      case 'wrong-password':
        errorMessage = 'Invalid password. Please try again.';
        break;
      case 'user-disabled':
        errorMessage = 'This user has been disabled. Please contact support.';
        break;
      case 'invalid-email':
        errorMessage =
            'The email address is not valid. Please check your email.';
        break;
      default:
        errorMessage =
            'An unexpected error occurred. Please try again later.\nError code: ${e.message}';
        break;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorMessage),
      duration: const Duration(seconds: 3),
    ));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('An unexpected error occurred: ${e.toString()}'),
      duration: const Duration(seconds: 3),
    ));
  }
}
