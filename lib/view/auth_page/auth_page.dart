import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class AuthPage extends StatelessWidget {
  static final _tabCount = 2;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Center(
          child: Login(),
        ),
      ),
    );
  }
}
