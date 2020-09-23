import 'package:flutter/material.dart';

import 'feed.dart';
import 'followers.dart';
import 'following.dart';
import 'story.dart';

class MainPage extends StatelessWidget {
  static final _tabCount = 4;

  @override
  Widget build(BuildContext context) {
    final header = _buildHeader(context);

    return DefaultTabController(
      length: _tabCount,
      child: Scaffold(
        appBar: header,
        body: TabBarView(
          children: [
            Feed(),
            Story(),
            Following(),
            Followers(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    final tabs = TabBar(
      tabs: [
        Tab(child: Text('Feed')),
        Tab(child: Text('Story')),
        Tab(child: Text('Following')),
        Tab(child: Text('Followers')),
      ],
    );

    final actions = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          RaisedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.exit_to_app),
            label: Text('Log out'),
          ),
        ],
      ),
    );

    final userInformation = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage:
                    NetworkImage('https://picsum.photos/250?image=9'),
              ),
              Text(
                'John Doe',
                style: theme.primaryTextTheme.headline6,
              ),
              Text('@handle'),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text(
                '15',
                style: theme.primaryTextTheme.headline5,
              ),
              Text('Following'),
            ],
          ),
          SizedBox(width: 16),
          Column(
            children: [
              Text(
                '10',
                style: theme.primaryTextTheme.headline5,
              ),
              Text('Followers'),
            ],
          ),
        ],
      ),
    );

    final headerContent = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        userInformation,
        actions,
        Spacer(),
        tabs,
      ],
    );

    return PreferredSize(
      preferredSize: Size.fromHeight(200),
      child: Material(
        color: theme.primaryColor,
        child: SafeArea(
          child: DefaultTextStyle(
            style: theme.primaryTextTheme.bodyText1,
            child: headerContent,
          ),
        ),
      ),
    );
  }
}
