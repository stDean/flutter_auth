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
      padding: imgPath == "lib/images/apLo.png"
          ? const EdgeInsets.all(10)
          : const EdgeInsets.all(12),
      margin: const EdgeInsets.only(
        top: 40,
        left: 10,
        right: 10,
      ),
      child: Image.asset(
        imgPath,
        width: imgPath == "lib/images/apLo.png" ? 45 : 40,
      ),
    );
  }
}
