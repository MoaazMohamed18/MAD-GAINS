import 'package:flutter/material.dart';
import 'package:madgains/Components/OrangeButton.dart';
import 'package:madgains/Components/PrimaryText.dart';
import 'package:madgains/Components/TextField.dart';
import 'package:madgains/Components/colors.dart';
import 'package:madgains/Google/google.dart';
import 'package:madgains/Home.dart';
import 'package:madgains/SignUpScreen/signUp.dart';
import '../ForgotPass/ForgotEmailorMobile.dart';
import 'LoginLogic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        color: blackColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Primarytext(
                text: 'Login into your account',
              ),
              const SizedBox(height: 20),
              Field(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter Your Email Address',
                isEmpty: islogEmailEmpty,
              ),
              const SizedBox(height: 20),
              Field(
                controller: passwordController,
                labelText: 'Password',
                hintText: 'Enter your Password',
                isEmpty: islogPasswordEmpty,
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                obscureText: !_passwordVisible,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Forgot your password?'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Forgotemailormobile()),
                      );
                    },
                    child: const Text(
                      'Reset your password',
                      style: TextStyle(color: orangeColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Orangebutton(
                onpressed: () {
                  login(context);
                },
                text: 'Login',
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Or'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),
              Orangebutton(
                text: 'Continue with Google',
                image: 'assets/images/google.png',
                color: blueColor,
                onpressed: () {
                  signInWithGoogle(context);
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      'Join Now',
                      style: TextStyle(color: blueColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
