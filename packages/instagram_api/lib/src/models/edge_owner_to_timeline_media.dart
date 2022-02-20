import 'package:json_annotation/json_annotation.dart';

import 'node.dart';

part 'edge_owner_to_timeline_media.g.dart';

@JsonSerializable()
class EdgeOwnerToTimelineMedia {
  final List<Node>? edges;

  EdgeOwnerToTimelineMedia({this.edges});

  factory EdgeOwnerToTimelineMedia.fromJson(Map<String, dynamic> data) => _$EdgeOwnerToTimelineMediaFromJson(data);
  Map<String, dynamic> toJson() => _$EdgeOwnerToTimelineMediaToJson(this);
}
