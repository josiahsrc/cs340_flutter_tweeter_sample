import 'package:flutter/material.dart';
import 'package:tweeter/model/model.dart';

class FollowingRequest {
  final User follower;
  final User lastFollowee;
  final int limit;

  FollowingRequest({
    @required this.follower,
    @required this.lastFollowee,
    @required this.limit,
  }) : super();

  Map<String, dynamic> toJson() {
    return {
      'follower': follower.toJson(),
      'lastFollowee': lastFollowee.toJson(),
      'limit': limit,
    };
  }
}
