// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edge_felix_video_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EdgeFelixVideoTimeline _$EdgeFelixVideoTimelineFromJson(
    Map<String, dynamic> json) {
  return EdgeFelixVideoTimeline(
    edges: (json['edges'] as List<dynamic>?)
        ?.map((e) => Node.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EdgeFelixVideoTimelineToJson(
        EdgeFelixVideoTimeline instance) =>
    <String, dynamic>{
      'edges': instance.edges,
    };
