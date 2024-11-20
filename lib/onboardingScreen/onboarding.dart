import 'package:flutter/material.dart';
import 'package:madgains/Components/OrangeButton.dart';
import 'package:madgains/Components/colors.dart';
import 'package:madgains/LoginScreen/login.dart';
import 'package:madgains/onboardingScreen/onboardingData.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 21, right: 21, top: 150, bottom: 30),
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          itemCount: OnboardingData.onboardingPagesData.length,
          itemBuilder: (context, index) => Center(
            child: Column(
              children: [
                Image.asset(OnboardingData.onboardingPagesData[index].image,
                    height: 150),
                const SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    OnboardingData.onboardingPagesData[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: blueColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    OnboardingData.onboardingPagesData[index].body,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: OnboardingData.onboardingPagesData
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.all(10),
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                              color: _pageIndex ==
                                      OnboardingData.onboardingPagesData
                                          .indexOf(e)
                                  ? orangeColor
                                  : Colors.grey,
                              shape: BoxShape.circle),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 64,
                ),
                if (_pageIndex == OnboardingData.onboardingPagesData.length - 1)
                  Orangebutton(
                    onpressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    text: 'Get Started',
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
