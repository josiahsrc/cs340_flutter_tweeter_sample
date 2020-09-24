import 'package:flutter/material.dart';
import 'package:tweeter/model/model.dart';

abstract class LoginView {
  void setIsLoading(bool value);
  void navigateToMainPage();
  void displayErrorMessage(String message);
}

class LoginPresenter {
  LoginPresenter({
    @required this.view,
  });

  final LoginView view;
  final LoginService _service = LoginService();

  Future<void> onLogIn({
    String handle,
    String password,
  }) async {
    view.setIsLoading(true);

    try {
      final response = await _service.login(
        LoginRequest(
          handle: handle,
          password: password,
        ),
      );

      print(response.user.handle);

      view.setIsLoading(false);
      view.navigateToMainPage();
    } on Error catch (e) {
      view.setIsLoading(false);
      view.displayErrorMessage(e.toString());
    }
  }
}
