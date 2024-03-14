import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obsecureText;
  final bool enabled;

  const InputField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obsecureText = false,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        enabled: enabled,
        textAlign: TextAlign.center,
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
