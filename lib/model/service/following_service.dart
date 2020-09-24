import 'package:tweeter/model/model.dart';

class FollowingService {
  Future<FollowingResponse> getFollowing(FollowingRequest request) async {
    return await ServerFacade().getFollowing(request);
  }
}
