import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';

class AuthPage extends StatelessWidget {
  static final _tabCount = 2;

  @override
  Widget build(BuildContext context) {
    final header = _buildHeader(context);

    final tabView = TabBarView(
      children: [
        Login(),
        Register(),
      ],
    );

    return DefaultTabController(
      length: _tabCount,
      child: Scaffold(
        appBar: header,
        body: tabView,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    final headerContent = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox.fromSize(
          size: Size.fromHeight(150),
          child: Center(
            child: Text(
              'Tweeter',
              style: theme.primaryTextTheme.headline3.copyWith(
                color: theme.primaryTextTheme.bodyText1.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Spacer(),
        TabBar(
          tabs: [
            Tab(child: Text('Login')),
            Tab(child: Text('Register')),
          ],
        ),
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
