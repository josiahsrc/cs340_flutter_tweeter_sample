import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final handleTextField = TextFormField(
      decoration: InputDecoration(
        labelText: 'Handle',
        alignLabelWithHint: true,
      ),
    );

    final passwordTextField = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        alignLabelWithHint: true,
      ),
    );

    final loginButton = RaisedButton(
      onPressed: () {},
      child: Text('Log in'),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 1),
            handleTextField,
            passwordTextField,
            Spacer(flex: 4),
            loginButton,
            Spacer(flex: 1),
          ],
        ),
    );
  }
}
