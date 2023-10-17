import 'dart:async';
import 'dart:convert';

import 'package:client/services/user_res.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<User> registerUser(
    String username,
    String email,
    String password,
  ) async {
    final res = await http.post(
      Uri.parse("http://10.0.2.2:5000/api/auth/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password
      }),
    );

    if (res.statusCode == 201) {
      return User.fromJson(jsonDecode(res.body));
    }

    throw Exception('Cant create user.');
  }

  Future<User> loginUser(
    String username,
    String password,
  ) async {
    final res = await http.post(
      Uri.parse("http://10.0.2.2:5000/api/auth/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (res.statusCode == 200) {
      return User.fromJson(jsonDecode(res.body));
    }

    throw Exception('Cant create user.');
  }
}
