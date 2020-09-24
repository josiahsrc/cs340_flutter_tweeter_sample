import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tweeter/model/model.dart';

@immutable
class Follow extends Equatable {
  final User follower;
  final User followee;

  const Follow({
    this.follower,
    this.followee,
  });

  @override
  List<Object> get props => [
        follower,
        followee,
      ];
}
