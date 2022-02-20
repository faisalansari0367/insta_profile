// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insta_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstaUser _$InstaUserFromJson(Map<String, dynamic> json) {
  return InstaUser(
    edgeOwnerToTimelineMedia: json['edge_owner_to_timeline_media'] == null
        ? null
        : EdgeOwnerToTimelineMedia.fromJson(
            json['edge_owner_to_timeline_media'] as Map<String, dynamic>),
    edgeFelixVideoTimeline: json['edge_felix_video_timeline'] == null
        ? null
        : EdgeFelixVideoTimeline.fromJson(
            json['edge_felix_video_timeline'] as Map<String, dynamic>),
    biography: json['biography'] as String?,
    id: json['id'] as String?,
    followers: json['edge_followed_by'] == null
        ? null
        : EdgeFollowedBy.fromJson(
            json['edge_followed_by'] as Map<String, dynamic>),
    following: json['edge_follow'] == null
        ? null
        : EdgeFollow.fromJson(json['edge_follow'] as Map<String, dynamic>),
    fullName: json['full_name'] as String?,
    hdImageUrl: json['profile_pic_url_hd'] as String?,
    imageUrl: json['profile_pic_url'] as String?,
    userName: json['username'] as String?,
  );
}

Map<String, dynamic> _$InstaUserToJson(InstaUser instance) => <String, dynamic>{
      'username': instance.userName,
      'profile_pic_url': instance.imageUrl,
      'profile_pic_url_hd': instance.hdImageUrl,
      'biography': instance.biography,
      'full_name': instance.fullName,
      'edge_followed_by': instance.followers,
      'edge_follow': instance.following,
      'id': instance.id,
      'edge_felix_video_timeline': instance.edgeFelixVideoTimeline,
      'edge_owner_to_timeline_media': instance.edgeOwnerToTimelineMedia,
    };
