import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tweeter/model/model.dart';

class FollowingRequest extends Equatable {
  final User follower;
  final User lastFollowee;
  final int limit;

  FollowingRequest({
    @required this.follower,
    @required this.lastFollowee,
    @required this.limit,
  }) : super();

  @override
  List<Object> get props => [follower, lastFollowee, limit];
}
