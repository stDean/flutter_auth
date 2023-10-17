class User {
  final String username;
  final String? msg;
  final String token;

  User({
    required this.msg,
    required this.username,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['userName'],
      msg: json['msg'],
      token: json['token'],
    );
  }
}
