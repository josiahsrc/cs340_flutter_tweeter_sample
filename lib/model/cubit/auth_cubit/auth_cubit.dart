import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tweeter/model/model.dart';
import 'package:tweeter/model/repository/user_repository.dart';
import 'package:tweeter/net/net.dart';

part 'auth_state.dart';

/// This is a business logic component. It holds a takes in an event
/// and pumps out a state. This is similar to the mvvm pattern.
///
/// More details here: https://pub.dev/packages/flutter_bloc
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    @required this.userRepo,
  }) : super(AuthState.initialState());

  /// A repository to hold the user data. The user is shared between
  /// multiple blocs. So we put this in a repository.
  final UserRepository userRepo;

  /// Logs in a user.
  Future<void> loginUser({
    String handle,
    String password,
  }) async {
    try {
      // Emit a new state which indicates that the login
      // process has started. Use this state to update the view
      // with a loading indicator.
      emit(state.copyWith(
        isLoading: true,
        friendlyError: '',
      ));

      final request = LoginRequest(
        handle: handle,
        password: password,
      );

      // Make a call to the backend to login.
      final response = await ServerFacade().loginResponse(request);

      // Here we update the repo to have the new user.
      userRepo.setCurrentUser(response.user);

      // Emit a new state which will hold the newly logged in user.
      emit(state.copyWith(
        isLoading: false,
      ));
    } on Error catch (e) {
      // Something went wrong. Display an error.
      emit(state.copyWith(
        isLoading: false,
        friendlyError: e.toString(),
      ));
    }
  }

  // TODO
  // Future<void> registerUser({ ... }) async { }
}
