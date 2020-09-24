import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweeter/model/model.dart';
import 'package:tweeter/presenter/presenter.dart';

class Following extends StatefulWidget {
  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> implements FollowingView {
  final List<User> _users = [];

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => FollowingPresenter(view: this),
      child: Builder(
        builder: _buildView,
      ),
    );
  }

  Widget _buildView(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          print('Pressed on user');
        },
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://picsum.photos/250?image=9',
          ),
        ),
        title: Text('John Doe'),
        subtitle: Text('@handle'),
      ),
    );
  }

  @override
  void setFollowingList(List<User> users) {
    // TODO: implement setFollowingList
  }
}
