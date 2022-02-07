// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insta_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstaUser _$InstaUserFromJson(Map<String, dynamic> json) {
  return InstaUser(
    feedImages: List<String>.from(json['feedImages'] ?? []),
    biography: json['biography'] as String?,
    id: json['id'] as int?,
    followers: json['followers'] as int?,
    following: json['following'] as int?,
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
      'biography': instance.biography,
      'fullName': instance.fullName,
      'followers': instance.followers,
      'following': instance.following,
      'id': instance.id,
      'feedImages': instance.feedImages,
    };
