import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, required this.onTap, required this.text});

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
            border: Border.all(
                width: 2, color: Colors.amber.shade100)), // BoxDecoration
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.amber.shade100,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ), // TextStyle
          ), // Text ), // Center
        ), // Container
      ),
    ); // GestureDetector
  }
}
