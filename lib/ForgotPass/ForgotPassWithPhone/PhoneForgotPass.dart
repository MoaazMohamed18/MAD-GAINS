import 'dart:math';
import 'package:flutter/material.dart';
import 'package:madgains/Components/OrangeButton.dart';
import 'package:madgains/Components/PrimaryText.dart';
import 'package:madgains/Components/SeconadaryText.dart';
import 'package:madgains/Components/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Components/TextField.dart';
import 'OTP.dart';

class MobileNumberOTP extends StatefulWidget {
  const MobileNumberOTP({super.key});

  @override
  _MobileNumberOTPState createState() => _MobileNumberOTPState();
}

class _MobileNumberOTPState extends State<MobileNumberOTP> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? verificationId;

  void _sendOtp() async {
    String phoneNumber = phoneController.text.trim();
    String email = emailController.text.trim();

    if (phoneNumber.isEmpty || email.isEmpty) {
      print('Please enter both phone number and email.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter both phone number and email.')),
      );
      return;
    }

    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: phoneNumber)
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (query.docs.isEmpty) {
      print('No user found with the provided phone number and email.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'No user found with the provided phone number and email.')),
      );
      return;
    }

    String generatedOtp = (100000 + Random().nextInt(900000)).toString();
    print("Generated OTP for $phoneNumber: $generatedOtp");

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => OTP_Page(
          verificationId: "dummy_verification_id",
          phoneNumber: phoneNumber,
          email: email,
          generatedOtp: generatedOtp,
        ),
      ),
    );
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
            icon: const Icon(Icons.arrow_back, color: blueColor)),
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
                text:
                    "Enter your phone number and email to receive an OTP to reset your password.",
              ),
              const SizedBox(height: 30),
              Field(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                labelText: 'Email',
                hintText: 'Enter Your Email',
              ),
              const SizedBox(height: 20),
              Field(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                labelText: 'Phone Number',
                hintText: 'Enter Your Phone Number',
              ),
              const SizedBox(height: 30),
              Orangebutton(
                text: 'Send OTP',
                onpressed: _sendOtp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
