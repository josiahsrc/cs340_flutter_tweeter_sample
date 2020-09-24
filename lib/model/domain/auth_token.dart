import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AuthToken extends Equatable {
  const AuthToken();

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken();
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List<Object> get props => [];
}
