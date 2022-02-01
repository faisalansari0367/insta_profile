// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insta_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstaUser _$InstaUserFromJson(Map<String, dynamic> json) {
  return InstaUser(
    followers: json['followers'] as String?,
    following: json['following'] as String?,
    fullName: json['fullName'] as String?,
    hdImageUrl: json['hdImageUrl'] as String?,
    imageUrl: json['imageUrl'] as String?,
    userName: json['userName'] as String?,
  );
}

Map<String, dynamic> _$InstaUserToJson(InstaUser instance) => <String, dynamic>{
      'userName': instance.userName,
      'imageUrl': instance.imageUrl,
      'hdImageUrl': instance.hdImageUrl,
      'followers': instance.followers,
      'following': instance.following,
      'fullName': instance.fullName,
    };
