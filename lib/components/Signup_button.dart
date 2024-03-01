import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;

  const Button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: EdgeInsets.only(top: 10),

        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2, color: Colors.black)), // BoxDecoration
        child: const Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ), // TextStyle
          ), // Text ), // Center
        ), // Container
      ),
    ); // GestureDetector
  }
}
