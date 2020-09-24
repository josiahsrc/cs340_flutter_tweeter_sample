import 'package:tweeter/model/model.dart';

class LoginService {
  Future<LoginResponse> login(LoginRequest request) async {
    return await ServerFacade().loginResponse(request);
  }
}
