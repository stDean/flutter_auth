import 'package:flutter/material.dart';

class LoginOption extends StatelessWidget {
  const LoginOption({super.key, required this.imgPath});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        top: 40,
        left: 10,
        right: 10,
      ),
      child: Image.asset(
        imgPath,
        // change to height
        height: 50,
      ),
    );
  }
}
