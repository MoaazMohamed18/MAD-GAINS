import 'package:flutter/material.dart';
import 'package:madgains/Components/OrangeButton.dart';
import 'package:madgains/Components/PrimaryText.dart';
import 'package:madgains/Components/SeconadaryText.dart';
import 'package:madgains/Components/TextField.dart';
import 'package:madgains/Components/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Reset/reset-pass.dart';

class OTP_Page extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;
  final String generatedOtp;
  final String email;

  OTP_Page(
      {required this.verificationId,
      required this.phoneNumber,
      required this.generatedOtp,
      Key? key,
      required this.email})
      : super(key: key);

  final List<TextEditingController> otpControllers =
      List.generate(6, (_) => TextEditingController());

  void verifyOtp(BuildContext context) async {
    String smsCode = otpControllers.map((controller) => controller.text).join();

    if (smsCode.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid OTP')),
      );
      return;
    }

    if (smsCode == generatedOtp) {
      DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
          .instance
          .collection('users')
          .where('phone', isEqualTo: phoneNumber)
          .limit(1)
          .get()
          .then((query) => query.docs.first);

      String email = userDoc.data()?['email'] ?? '';

      if (email.isNotEmpty) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ResetPage(email: email)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('No account associated with this phone number.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP, please try again')),
      );
    }
  }

  void _onOtpFieldChanged(BuildContext context, int index, String value) {
    if (value.isNotEmpty && index < otpControllers.length - 1) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
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
                text: 'Enter OTP',
              ),
              const SizedBox(height: 10),
              const Secondarytext(
                text: "Please enter the OTP sent to your mobile number.",
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(otpControllers.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: SizedBox(
                      width: 40,
                      child: Field(
                        controller: otpControllers[index],
                        textAlign: TextAlign.center,
                        labelText: 'OTP',
                        hintText: '_',
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        onChanged: (value) {
                          _onOtpFieldChanged(context, index, value);
                        },
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 30),
              Orangebutton(
                onpressed: () => verifyOtp(context),
                text: 'Verify OTP',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
