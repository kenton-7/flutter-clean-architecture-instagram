import 'package:equatable/equatable.dart';
import 'package:instagram/data/models/story.dart';

// ignore: must_be_immutable
class UserPersonalInfo extends Equatable {
  String bio;
  String email;
  String name;
  String profileImageUrl;
  String userName;
  dynamic userId;
  List<dynamic> followedPeople;
  List<dynamic> followerPeople;
  List<dynamic> posts;
  List<dynamic> stories;
  List<Story>? storiesInfo;
  List<dynamic> charactersOfName;

  UserPersonalInfo(
      {required this.followedPeople,
      required this.followerPeople,
      required this.posts,
      required this.stories,
      required this.charactersOfName,
      this.storiesInfo,
      this.name = "",
      this.bio = "",
      this.email = "",
      this.profileImageUrl = "",
      this.userName = "",
      this.userId = ""});

  static UserPersonalInfo fromDocSnap(Map<String, dynamic>? snap) {
    return UserPersonalInfo(
      name: snap?["name"] ?? "",
      bio: snap?["bio"] ?? "",
      email: snap?["email"] ?? "",
      profileImageUrl: snap?["profileImageUrl"] ?? "",
      userName: snap?["userName"] ?? "",
      userId: snap?["uid"] ?? "",
      followedPeople: snap?["following"] ?? [],
      followerPeople: snap?["followers"] ?? [],
      posts: snap?["posts"] ?? [],
      stories: snap?["stories"] ?? [],
      charactersOfName: snap?["charactersOfName"] ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'following': followedPeople,
      'followers': followerPeople,
      'posts': posts,
      'stories': stories,
      'name': name,
      'userName': userName,
      'bio': bio,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'charactersOfName': charactersOfName,
      'uid': userId,
    };
  }

  @override
  List<Object?> get props => [
        bio,
        email,
        name,
        profileImageUrl,
        userName,
        userId,
        followedPeople,
        followerPeople,
        posts,
        stories,
        storiesInfo,
      ];
}
