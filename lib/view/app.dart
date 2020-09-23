import 'package:flutter/material.dart';
import 'package:tweeter/view/view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Tweeter',
      theme: AppTheme.define(),
      routes: AppRoutes.define(),
      initialRoute: AppRoutes.authPage,
    );

    return app;
  }
}
