import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginRequest extends Equatable {
  final String handle;
  final String password;

  LoginRequest({
    @required this.handle,
    @required this.password,
  }) : super();

  @override
  List<Object> get props => [handle, password];
}
