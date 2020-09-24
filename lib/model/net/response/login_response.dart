import 'package:flutter/material.dart';
import 'package:tweeter/model/model.dart';

class LoginResponse {
  final User user;
  final AuthToken token;

  LoginResponse({
    @required this.user,
    @required this.token,
  }) : super();

  factory LoginResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return LoginResponse(
      user: User.fromJson(json['user']),
      token: AuthToken.fromJson(json['token']),
    );
  }
}
