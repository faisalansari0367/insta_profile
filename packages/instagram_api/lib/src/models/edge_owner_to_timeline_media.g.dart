// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edge_owner_to_timeline_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EdgeOwnerToTimelineMedia _$EdgeOwnerToTimelineMediaFromJson(
    Map<String, dynamic> json) {
  return EdgeOwnerToTimelineMedia(
    edges: (json['edges'] as List<dynamic>?)
        ?.map((e) => Node.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EdgeOwnerToTimelineMediaToJson(
        EdgeOwnerToTimelineMedia instance) =>
    <String, dynamic>{
      'edges': instance.edges,
    };
