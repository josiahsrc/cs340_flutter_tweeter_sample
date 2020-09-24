import 'package:flutter/material.dart';

class LoginRequest {
  final String handle;
  final String password;

  LoginRequest({
    @required this.handle,
    @required this.password,
  }) : super();

  Map<String, dynamic> toJson() {
    return {
      'handle': handle,
      'password': password,
    };
  }
}
