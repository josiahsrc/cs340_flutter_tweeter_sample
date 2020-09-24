import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweeter/presenter/presenter.dart';
import 'package:tweeter/view/routing.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginView {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => LoginPresenter(
        view: this
      ),
      child: Builder(
        builder: _buildView,
      ),
    );
  }

  Widget _buildView(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

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
      // TODO: use data from the form.
      onPressed: () => presenter.onLogIn(
        handle: 'johndoe',
        password: 'password',
      ),
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

  @override
  void displayErrorMessage(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  void navigateToMainPage() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.mainPage);
  }

  @override
  void setIsLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }
}
