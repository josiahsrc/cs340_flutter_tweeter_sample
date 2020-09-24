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
      create: (context) => LoginPresenter(view: this),
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

    final loginButton = RaisedButton(
      // TODO:
      // Use data from a login form to call the login function.
      onPressed: () => presenter.onLogIn(
        handle: 'johndoe',
        password: 'password',
      ),
      child: Text('Log in'),
    );

    // TODO:
    // Actually display a login form here.
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('An almost completely unimplemented login view. Replace '
              'this with your own and update the code in the LoginService.'),
          loginButton,
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
