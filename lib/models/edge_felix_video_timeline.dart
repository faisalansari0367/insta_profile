import 'package:insta_profile/models/edges.dart';
import 'package:json_annotation/json_annotation.dart';

import 'node.dart';

part 'edge_felix_video_timeline.g.dart';

@JsonSerializable()
class EdgeFelixVideoTimeline {
  // @JsonKey(name: 'edge_felix_video_timeline')
  final List<Node>? edges;

  const EdgeFelixVideoTimeline({this.edges});

  factory EdgeFelixVideoTimeline.fromJson(Map<String, dynamic> data) => _$EdgeFelixVideoTimelineFromJson(data);
  Map<String, dynamic> toJson() => _$EdgeFelixVideoTimelineToJson(this);
}
