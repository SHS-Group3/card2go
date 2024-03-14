import 'package:flutter/material.dart';

class Button2 extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const Button2(
      {super.key,
      required this.onTap,
      required this.text,
      this.padding = const EdgeInsets.all(5),
      this.margin = const EdgeInsets.only(top: 30)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,

        decoration: BoxDecoration(
            color: Color(0xff123a05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: Color(0xff123a05),
            )), // BoxDecoration
        child: Center(
          child: Text(
            text,
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
