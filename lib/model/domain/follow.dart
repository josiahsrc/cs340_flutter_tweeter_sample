import 'package:equatable/equatable.dart';
import 'package:tweeter/model/model.dart';

class Follow extends Equatable {
  final User follower;
  final User followee;

  const Follow({
    this.follower,
    this.followee,
  });

  factory Follow.fromJson(Map<String, dynamic> json) {
    return Follow(
      follower: User.fromJson(json['follower']),
      followee: User.fromJson(json['followee']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'follower': follower.toJson(),
      'followee': followee.toJson(),
    };
  }

  @override
  List<Object> get props => [
        follower,
        followee,
      ];
}
