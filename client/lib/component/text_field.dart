import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.errMsg,
    required this.controller,
  });

  final String hintText;
  final bool obscureText;
  final String errMsg;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errMsg;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
      style: const TextStyle(letterSpacing: 1),
      obscureText: obscureText,
    );
  }
}
