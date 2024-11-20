import 'package:flutter/material.dart';
import 'colors.dart';

class Secondarytext extends StatelessWidget {
  final text;

  const Secondarytext({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: blueColor,
      ),
    );
  }
}
