import 'package:json_annotation/json_annotation.dart';

import 'node_data.dart';

part 'node.g.dart';

@JsonSerializable()
class Node {
  @JsonKey(name: 'node')
  final NodeData? nodeData;
  // final String? typeName;

  // @JsonKey(name: 'display_url')
  // final String? displayUrl;

  // @JsonKey(name: 'is_video', defaultValue: false)
  // final bool? isVideo;
  // @JsonKey(name: 'video_url')
  // final String? videoUrl;
  // @JsonKey(name: 'video_duration', defaultValue: 0.0)
  // final double? videoDuration;

  // final Dimensions? dimensions;
  // final Edges? edges;

  Node({this.nodeData});

  factory Node.fromJson(Map<String, dynamic> data) => _$NodeFromJson(data);
  Map<String, dynamic> toJson() => _$NodeToJson(this);
}
