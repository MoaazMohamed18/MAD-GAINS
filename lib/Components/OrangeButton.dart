import 'package:flutter/material.dart';
import 'package:madgains/Components/colors.dart';

class Orangebutton extends StatelessWidget {
  final String text;
  final Function()? onpressed;
  final String? image;
  final Color? color;

  const Orangebutton(
      {super.key,
      required this.text,
      required this.onpressed,
      this.image,
      this.color = orangeColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  image!,
                  height: 25,
                  width: 25,
                ),
              ),
            Text(
              text,
              style: const TextStyle(color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
