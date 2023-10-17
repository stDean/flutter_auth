import 'package:client/component/my_button.dart';
import 'package:client/component/text_field.dart';
import 'package:client/screens/login_screen.dart';
import 'package:client/services/service.dart';
import 'package:client/services/storage.dart';
import 'package:client/services/user_res.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _password;

  User? _user;

  @override
  void initState() {
    _username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void displayDialog(
    BuildContext context,
    String title,
    String text,
  ) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(text),
        ),
      );

  void register() async {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      _user = await Service().registerUser(
        _username.text,
        _email.text,
        _password.text,
      );
    }

    if (_user != null) {
      SecureStorage().writeSecureData('token', _user!.token);
    }

    print(_user);
    // print(_user!.token);
    // print(_user!.msg);
    // print(_user!.username);
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
                    'Welcome to Our App!!.',
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
                          controller: _email,
                          hintText: 'email',
                          obscureText: false,
                          errMsg: "email address is required",
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

                  const SizedBox(height: 30),

                  // button
                  MyButton(
                    buttonText: 'Register',
                    onTap: register,
                  ),

                  const SizedBox(height: 140),

                  // register text
                  Text.rich(
                    TextSpan(
                      text: "Have an account? ",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login Now',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
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
