import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tweeter/presenter/presenter.dart';
import 'package:tweeter/view/routing.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> implements SignInView {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => SignInPresenter(
        view: this
      ),
      child: Builder(
        builder: _buildView,
      ),
    );
  }

  Widget _buildView(BuildContext context) {
    final presenter = Provider.of<SignInPresenter>(context);

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
      onPressed: () => presenter.onLogIn(),
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
