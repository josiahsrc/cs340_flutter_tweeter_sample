import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweeter/model/model.dart';
import 'package:tweeter/presenter/presenter.dart';

class Following extends StatefulWidget {
  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> implements FollowingView {
  List<User> _following = []; // TODO actually use this to show the following.

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
    setState(() {
      _following = users;
    });
  }

  @override
  void displayErrorMessage(String error) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(error),
    ));
  }
}
