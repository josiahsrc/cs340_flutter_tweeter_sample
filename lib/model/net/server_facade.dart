import 'package:tweeter/model/model.dart';

class ServerFacade {
  static final ServerFacade _instance = ServerFacade._();

  factory ServerFacade() {
    return _instance;
  }

  const ServerFacade._();

  Future<LoginResponse> loginResponse(LoginRequest request) async {
    // TODO: generate this data instead of hardcoding the response!
    await Future.delayed(Duration(seconds: 1));
    return LoginResponse(
      user: User(
        firstName: 'John',
        lastName: 'Doe',
        handle: 'johndoe',
        photoURL: '',
      ),
      token: AuthToken(),
    );
  }

  Future<FollowingResponse> getFollowing(FollowingRequest request) async {
    // TODO: generate this data instead of hardcoding the response!
    await Future.delayed(Duration(seconds: 1));
    return FollowingResponse(
      followees: [
        User(
          firstName: 'Jane',
          lastName: 'Johnson',
          handle: 'followee1',
          photoURL: '',
        ),
        User(
          firstName: 'Jane',
          lastName: 'Johnson',
          handle: 'followee2',
          photoURL: '',
        ),
        User(
          firstName: 'Jane',
          lastName: 'Johnson',
          handle: 'followee3',
          photoURL: '',
        ),
      ],
    );
  }
}
