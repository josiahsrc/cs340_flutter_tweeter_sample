import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tweeter/model/model.dart';

class LoginResponse extends Equatable {
  final User user;
  final AuthToken token;

  const LoginResponse({
    @required this.user,
    @required this.token,
  }) : super();

  @override
  List<Object> get props => [user, token];
}
