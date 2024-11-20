import 'package:flutter/material.dart';
import 'package:madgains/Components/OrangeButton.dart';
import 'package:madgains/onboardingScreen/onboarding.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 70.0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Orangebutton(
                text: 'Get Started',
                onpressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const OnboardingScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
