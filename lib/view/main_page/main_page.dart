import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tweeter/view/routing.dart';

class MainPage extends StatelessWidget {
  static final _tabCount = 4;

  @override
  Widget build(BuildContext context) {
    final header = _buildHeader(context);

    final fab = Builder(
      builder: (context) => FloatingActionButton(
        child: Icon(Icons.drafts),
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Replace with your own action'),
          ));
        },
      ),
    );

    // TODO: Create new widgets for the story, feed, follower, following
    // and place them here.
    final tabView = TabBarView(
      children: [
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );

    return DefaultTabController(
      length: _tabCount,
      child: Scaffold(
        appBar: header,
        body: tabView,
        floatingActionButton: fab,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final nav = Navigator.of(context);

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
          IconButton(
            // TODO:
            // Use a presenter to actually logout the user and THEN
            // tell the view to navigate back to the auth page.
            color: theme.primaryIconTheme.color,
            onPressed: () => nav.pushReplacementNamed(AppRoutes.authPage),
            icon: Icon(Icons.exit_to_app),
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
                backgroundImage: NetworkImage(
                  'https://picsum.photos/250?image=9',
                ),
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
        actions,
        userInformation,
        Spacer(),
        tabs,
      ],
    );

    return PreferredSize(
      preferredSize: Size.fromHeight(200),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Material(
          color: theme.primaryColor,
          child: SafeArea(
            child: DefaultTextStyle(
              style: theme.primaryTextTheme.bodyText1,
              child: headerContent,
            ),
          ),
        ),
      ),
    );
  }
}
