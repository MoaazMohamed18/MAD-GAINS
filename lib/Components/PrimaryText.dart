import 'package:flutter/material.dart';
import 'colors.dart';

class Primarytext extends StatelessWidget {
  final text;

  const Primarytext({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: blueColor,
      ),
    );
  }
}
