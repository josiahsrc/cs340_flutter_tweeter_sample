import 'package:tweeter/model/model.dart';

class FollowingService {
  FollowingService();

  Future<FollowingResponse> getFollowees(FollowingRequest request) async {
    FollowingResponse response = await ServerFacade().getFollowees(request);
  }
}
