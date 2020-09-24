import 'package:flutter/material.dart';

class SignInRequest {
  final String handle;
  final String password;

  SignInRequest({
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
