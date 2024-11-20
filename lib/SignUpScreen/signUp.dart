import 'package:flutter/material.dart';
import 'package:madgains/Components/OrangeButton.dart';
import 'package:madgains/Components/PrimaryText.dart';
import 'package:madgains/Components/SeconadaryText.dart';
import 'package:madgains/Components/colors.dart';
import 'package:madgains/SignUpScreen/registerlogic.dart';
import '../Components/TextField.dart';
import '../Home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _passwordVisible = false;
  DateTime? selectedDate;
  String? verificationId;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
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
            icon: const Icon(
              Icons.arrow_back,
              color: blueColor,
            )),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Primarytext(
                text: 'Create an account',
              ),
              const SizedBox(height: 10),
              const Secondarytext(
                text: "Let's create your account.",
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Field(
                      controller: nameController,
                      labelText: 'First Name',
                      hintText: 'First Name',
                      isEmpty: isNameEmpty,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Field(
                      controller: lastNameController,
                      labelText: 'Last Name',
                      hintText: 'Last Name',
                      isEmpty: isLastNameEmpty,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Field(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                labelText: 'Phone Number',
                hintText: 'Enter your Phone Number',
                isEmpty: isPhoneEmpty,
              ),
              const SizedBox(height: 20),
              Field(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter Your Email Address',
                isEmpty: isEmailEmpty,
              ),
              const SizedBox(height: 20),
              Field(
                controller: passwordController,
                labelText: 'Password',
                hintText: 'Enter your Password',
                isEmpty: isPasswordEmpty,
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
              const SizedBox(height: 5),
              const Text(
                'Minimum of 8 characters\nUppercase, lowercase letters and one number at least',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Field(
                controller: dobController,
                readOnly: true,
                labelText: 'Date of Birth',
                hintText: 'Select your Date of Birth',
                isEmpty: isDobEmpty,
                suffixIcon: const Icon(Icons.calendar_today),
                ontap: () => _selectDate(context),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        text: 'By creating an account, you agree to the ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              color: blueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: ' and our '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: blueColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Orangebutton(
                text: 'Create an Account',
                onpressed: () {
                  register(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
