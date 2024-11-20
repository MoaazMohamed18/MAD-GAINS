import 'package:flutter/material.dart';
import 'package:madgains/Components/PrimaryText.dart';
import 'package:madgains/Components/SeconadaryText.dart';
import '../Components/colors.dart';
import 'ForgotPassWithPhone/PhoneForgotPass.dart';
import 'ForgotPassWithEmail/EmailForgotPass.dart';

class Forgotemailormobile extends StatelessWidget {
  const Forgotemailormobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: blueColor,
            )),
      ),
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Primarytext(
                text: 'Forgot Password',
              ),
              const SizedBox(height: 10),
              const Secondarytext(
                text: "Reset password using:",
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage()),
                      );
                    },
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child:
                              Icon(Icons.email, color: orangeColor, size: 40.0),
                        ),
                        Text(
                          'Email Address',
                          style: TextStyle(
                              color: orangeColor, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const MobileNumberOTP()),
                      );
                    },
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child:
                              Icon(Icons.phone, color: orangeColor, size: 40.0),
                        ),
                        Text(
                          'Phone number',
                          style: TextStyle(
                              color: orangeColor, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
