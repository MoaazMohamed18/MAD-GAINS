import 'package:flutter/material.dart';
import 'dart:async';
import 'package:madgains/StartScreens/start.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/streamWidget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/madgains.jpg', fit: BoxFit.cover);
  }
}

Future<void> _navigate(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3));

  final prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

  if (isFirstLaunch) {
    await prefs.setBool('isFirstLaunch', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Start()),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StreamWidget()),
    );
  }
}

Future<void> _resetFirstLaunch() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('isFirstLaunch'); // Reset flag
}
