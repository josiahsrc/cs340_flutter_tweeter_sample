import 'package:flutter/material.dart';
import 'package:tweeter/view/view.dart';

class AppRoutes {
  const AppRoutes._();

  static const String mainPage = '/main-page';
  static const String authPage = '/auth-page';

  static Map<String, WidgetBuilder> define() => {
        mainPage: (context) => MainPage(),
        authPage: (context) => AuthPage(),
      };
}
