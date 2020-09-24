import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  final String firstName;
  final String lastName;
  final String handle;
  final String photoURL;

  const User({
    this.firstName,
    this.lastName,
    this.handle,
    this.photoURL,
  }) : super();

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      handle: json['handle'],
      photoURL: json['photoURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'handle': handle,
      'photoURL': photoURL,
    };
  }

  @override
  List<Object> get props => [
        firstName,
        lastName,
        handle,
        photoURL,
      ];
}
