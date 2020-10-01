import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tweeter/model/model.dart';
import 'package:tweeter/view/routing.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use the auth bloc to rebuild the view.
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // If the state reported an error, display an error to the user.
        if (state.friendlyError.isNotEmpty) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(state.friendlyError),
          ));
        }

        // If the current user isn't null, then we signed in successfully.
        // Navigate to the home page.
        if (state.currentUser != null) {
          print('Login successful');
          Navigator.of(context).pushReplacementNamed(AppRoutes.mainPage);
        }
      },
      builder: _buildView,
    );
  }

  Widget _buildView(BuildContext context, AuthState state) {
    final authBloc = context.bloc<AuthCubit>();

    // If the auth state is loading, display a loading bar.
    if (state.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final loginButton = RaisedButton(
      // TODO:
      // Use data from a login form to call the login function.
      onPressed: () => authBloc.loginUser(
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
}
