import 'package:flutter/material.dart';
import 'package:tweeter/model/model.dart';

abstract class FollowingView {
  void displayErrorMessage(String error);
  void setFollowingList(List<User> users);
}

class FollowingPresenter {
  FollowingPresenter({
    @required this.view,
  });

  final FollowingView view;
  final FollowingService _service = FollowingService();
  final List<User> _users = [];

  Future<void> onLogIn() async {
    try {
      // TODO: Use generated data here instead.
      final response = await _service.getFollowing(
        FollowingRequest(
          follower: User(
            firstName: 'John',
            lastName: 'Doe',
            handle: 'john',
          ),
          lastFollowee: User(handle: 'followee1'),
          limit: 5,
        ),
      );

      _users.addAll(response.followees);
      view.setFollowingList(_users);
    } catch (e) {
      view.displayErrorMessage('Failed to get following');
    }
  }
}
