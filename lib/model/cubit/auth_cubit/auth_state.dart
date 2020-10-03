part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.isLoading,
    this.friendlyError,
  });

  factory AuthState.initialState() {
    return AuthState(
      isLoading: false,
      friendlyError: '',
    );
  }

  /// Whether the auth state is loading (e.g. the user is signing in).
  final bool isLoading;

  /// A friendly error detailing what went wrong when siging in.
  final String friendlyError;

  @override
  List<Object> get props => [
        isLoading,
        friendlyError,
      ];

  /// Copies the current object with some new fields.
  AuthState copyWith({
    bool isLoading,
    String friendlyError,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      friendlyError: friendlyError ?? this.friendlyError,
    );
  }
}
