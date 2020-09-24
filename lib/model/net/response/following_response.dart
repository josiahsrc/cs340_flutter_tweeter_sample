import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tweeter/model/model.dart';

class FollowingResponse extends Equatable {
  final List<User> followees;

  const FollowingResponse({
    @required this.followees,
  }) : super();

  @override
  List<Object> get props => [followees];
}
