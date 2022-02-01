import 'package:json_annotation/json_annotation.dart';
part 'insta_user.g.dart';

@JsonSerializable()
class InstaUser {
  String? userName, imageUrl, hdImageUrl, followers, following, fullName;
  InstaUser({
    this.followers,
    this.following,
    this.fullName,
    this.hdImageUrl,
    this.imageUrl,
    this.userName,
  });

  factory InstaUser.fromJson(Map<String,dynamic> data) => _$InstaUserFromJson(data);
  Map<String,dynamic> toJson() => _$InstaUserToJson(this);
}
