import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../LoginScreen/login.dart';

TextEditingController nameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController dobController = TextEditingController();
bool isChecked = false;

bool isNameEmpty = false;
bool isLastNameEmpty = false;
bool isPhoneEmpty = false;
bool isEmailEmpty = false;
bool isPasswordEmpty = false;
bool isDobEmpty = false;

void register(BuildContext context) async {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();
  String name = nameController.text.trim();
  String lastName = lastNameController.text.trim();
  String phone = phoneNumberController.text.trim();
  String dob = dobController.text.trim();

  isNameEmpty = name.isEmpty;
  isLastNameEmpty = lastName.isEmpty;
  isPhoneEmpty = phone.isEmpty;
  isEmailEmpty = email.isEmpty;
  isPasswordEmpty = password.isEmpty;
  isDobEmpty = dob.isEmpty;

  if (isNameEmpty ||
      isLastNameEmpty ||
      isPhoneEmpty ||
      isEmailEmpty ||
      isPasswordEmpty ||
      isDobEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill in all fields')),
    );
    (context as Element).markNeedsBuild();
    return;
  }

  if (!isChecked) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('You must agree to the Terms & Conditions')),
    );
    return;
  }

  RegExp passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  if (!passwordRegExp.hasMatch(password)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password does not meet the requirements')),
    );
    return;
  }

  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user?.uid)
        .set({
      'name': name,
      'lastName': lastName,
      'phone': phone,
      'dob': dob,
      'email': email,
    });

    print("User registered: ${userCredential.user?.email}");
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  } on FirebaseAuthException catch (e) {
    String errorMessage;

    switch (e.code) {
      case 'email-already-in-use':
        errorMessage = 'The account already exists for that email.';
        break;
      case 'weak-password':
        errorMessage = 'The password provided is too weak.';
        break;
      case 'invalid-email':
        errorMessage =
            'The email address is not valid. Please check your email.';
        break;
      default:
        errorMessage =
            'An unexpected error occurred. Please try again later.\nError code: ${e.code} - ${e.message}';
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
