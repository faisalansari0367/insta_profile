import 'package:equatable/equatable.dart';
import 'package:insta_profile/models/edge_felix_video_timeline.dart';
import 'package:insta_profile/models/edge_follow.dart';
import 'package:insta_profile/models/edge_followed_by.dart';
import 'package:insta_profile/models/edge_owner_to_timeline_media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insta_user.g.dart';

@JsonSerializable()
class InstaUser extends Equatable {
  @JsonKey(name: 'username')
  final String? userName;

  @JsonKey(name: 'profile_pic_url')
  final String? imageUrl;

  @JsonKey(name: 'profile_pic_url_hd')
  final String? hdImageUrl;

  @JsonKey(name: 'biography')
  final String? biography;

  @JsonKey(name: 'full_name')
  final String? fullName;

  @JsonKey(name: 'edge_followed_by', fromJson: EdgeFollowedBy.fromJson)
  final EdgeFollowedBy? followers;

  @JsonKey(name: 'edge_follow', fromJson: EdgeFollow.fromJson)
  final EdgeFollow? following;
  final String? id;

  @JsonKey(name: 'edge_felix_video_timeline', fromJson: EdgeFelixVideoTimeline.fromJson)
  final EdgeFelixVideoTimeline? edgeFelixVideoTimeline;
  @JsonKey(name: 'edge_owner_to_timeline_media', fromJson: EdgeOwnerToTimelineMedia.fromJson)
  final EdgeOwnerToTimelineMedia? edgeOwnerToTimelineMedia;

  const InstaUser({
    this.edgeOwnerToTimelineMedia,
    this.edgeFelixVideoTimeline,
    this.biography,
    this.id,
    this.followers,
    this.following,
    this.fullName,
    this.hdImageUrl,
    this.imageUrl,
    this.userName,
  });

  factory InstaUser.fromJson(Map<String, dynamic> data) => _$InstaUserFromJson(data);
  Map<String, dynamic> toJson() => _$InstaUserToJson(this);

  @override
  List<Object?> get props => [
        userName,
        imageUrl,
        hdImageUrl,
        followers,
        following,
        fullName,
        id,
      ];
}
