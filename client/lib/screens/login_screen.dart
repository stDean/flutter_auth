import 'package:client/component/my_button.dart';
import 'package:client/component/text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  void signIn() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40.0,
            left: 30,
            right: 30,
            // bottom: 10,
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  // Lock Logo
                  Image.asset(
                    'lib/images/lock-icon.png',
                    width: 90,
                    color: Colors.grey.shade800,
                  ),

                  // Welcome text
                  const SizedBox(height: 70),
                  Text(
                    'Welcome back, you\'ve been missed.',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // form field
                  Form(
                    key: _formKey,
                    child: const Column(
                      children: [
                        MyTextField(
                          hintText: 'username',
                          obscureText: false,
                          errMsg: "username is required",
                        ),
                        SizedBox(height: 20),
                        MyTextField(
                          hintText: 'password',
                          obscureText: true,
                          errMsg: "password is required",
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // forget text
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forget Password?'),
                  ),

                  const SizedBox(height: 20),

                  // button
                  MyButton(
                    buttonText: 'Sign In',
                    onTap: signIn,
                  )
                  // or text

                  // google and apple button

                  // register text
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
