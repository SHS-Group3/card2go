import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const Button({super.key, required this.onTap, required this.text, this.padding = const EdgeInsets.all(14), this.margin = const EdgeInsets.only(top: 10)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,

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
