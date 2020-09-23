import 'package:flutter/material.dart';
import 'package:tweeter/ui/ui.dart';

class Routes {
  const Routes._();

  static const String home = '/';
  static const String signIn = '/sign-in-view';
  static const String signUp = '/sign-up-view';
  static const String user = '/user-view';
  static const String postStatus = '/post-status-view';
  static const String followers = '/followers-view';

  static Map<String, WidgetBuilder> define() => {
        home: (context) => HomeView(),
        signIn: (context) => SignInView(),
        signUp: (context) => SignUpView(),
      };
}
