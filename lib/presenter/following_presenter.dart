import 'package:flutter/material.dart';
import 'package:tweeter/model/model.dart';

abstract class FollowingView {
  void setFollowingList(List<User> users);
}

class FollowingPresenter {
  FollowingPresenter({
    @required this.view,
  });

  final FollowingView view;
  final List<User> _users = [];

  Future<void> onLogIn() async {
    await Future.delayed(Duration(seconds: 1));
    view.setFollowingList(_users);
  }
}
