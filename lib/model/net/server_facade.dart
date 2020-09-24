import 'package:tweeter/model/model.dart';

class ServerFacade {
  static final ServerFacade _instance = ServerFacade._();

  factory ServerFacade() {
    return _instance;
  }
  
  const ServerFacade._();

  // final 

  Future<FollowingResponse> getFollowees(FollowingRequest request) async {
  //   assert(request.limit >= 0);
  //   assert(request.follower != null);
  // }

  //   Map<User, List<User>> initializeFollowees() {
  //       Map<User, List<User>> followeesByFollower = {};
  //       List<Follow> follows = getFollowGenerator().generateUsersAndFollows(100,
  //               0, 50, FollowGenerator.Sort.FOLLOWER_FOLLOWEE);

  //       for(Follow follow in follows) {
  //           List<User> followees = followeesByFollower.get(follow.getFollower());

  //           if(followees == null) {
  //               followees = new ArrayList<>();
  //               followeesByFollower.put(follow.getFollower(), followees);
  //           }

  //           followees.add(follow.getFollowee());
  //       }

  //       return followeesByFollower;
    }
}
