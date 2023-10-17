import 'package:client/component/login_options.dart';
import 'package:client/component/my_button.dart';
import 'package:client/component/text_field.dart';
import 'package:client/screens/register_screen.dart';
import 'package:client/services/service.dart';
import 'package:client/services/user_res.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _username;
  late final TextEditingController _password;

  User? _user;

  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  void signIn() async {
    final prefs = await SharedPreferences.getInstance();
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      try {
        _user = await Service().loginUser(
          _username.text,
          _password.text,
        );
      } catch (e) {
        print("an error occured");
      }
    }

    if (_user != null) {
      prefs.setString('token', _user!.token);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
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
            top: 50.0,
            left: 30,
            right: 30,
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Lock Logo
                  Image.asset(
                    'lib/images/lock-icon.png',
                    width: 65,
                    color: Colors.grey.shade800,
                  ),

                  // Welcome text
                  const SizedBox(height: 60),
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
                    child: Column(
                      children: [
                        MyTextField(
                          controller: _username,
                          hintText: 'username',
                          obscureText: false,
                          errMsg: "username is required",
                        ),
                        const SizedBox(height: 20),
                        MyTextField(
                          controller: _password,
                          hintText: 'password',
                          obscureText: true,
                          errMsg: "password is required",
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  // forget text
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // button
                  MyButton(
                    buttonText: 'Sign In',
                    onTap: signIn,
                  ),

                  const SizedBox(height: 45),

                  // or text
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 7,
                        ),
                        child: Text(
                          "Or Continue With",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),

                  // google and apple button
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LoginOption(imgPath: "lib/images/google.png"),
                      LoginOption(imgPath: "lib/images/apLo.png"),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // register text
                  Text.rich(
                    TextSpan(
                      text: "Not a Member? ",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'Register Now',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
