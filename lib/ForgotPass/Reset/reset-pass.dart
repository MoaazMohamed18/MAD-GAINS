import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:madgains/Components/OrangeButton.dart';
import 'package:madgains/Components/PrimaryText.dart';
import 'package:madgains/Components/colors.dart';
import 'package:madgains/LoginScreen/login.dart';
import '../../Components/TextField.dart';

class ResetPage extends StatefulWidget {
  final String email;
  const ResetPage({Key? key, required this.email}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void resetPassword() async {
    String password = passwordController.text.trim();

    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both password fields')),
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

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(passwordController.text);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password changed successfully!')),
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not authenticated')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset failed: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: blueColor),
        ),
      ),
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Primarytext(
                text: 'Reset Password',
              ),
              const SizedBox(height: 20),
              Field(
                controller: passwordController,
                labelText: 'New Password',
                hintText: 'Enter Your New Password',
                obscureText: true,
              ),
              SizedBox(height: 20),
              Field(
                controller: confirmPasswordController,
                labelText: 'Confirm Password',
                hintText: 'Confirm Your Password',
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Orangebutton(
                text: 'Reset Password',
                onpressed: resetPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
