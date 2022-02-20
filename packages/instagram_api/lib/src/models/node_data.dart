import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'node_data.g.dart';

@JsonSerializable()
class NodeData {
  @JsonKey(name: '__typename')
  final String? typeName;

  @JsonKey(name: 'display_url')
  final String? displayUrl;

  @JsonKey(name: 'is_video', defaultValue: false)
  final bool isVideo;
  @JsonKey(name: 'video_url')
  final String? videoUrl;
  @JsonKey(name: 'video_duration', defaultValue: 0.0)
  final double? videoDuration;

  final Dimensions? dimensions;

  final Edges? edges;
  @JsonKey(fromJson: EdgeSidecarToChildren.fromJson, name: 'edge_sidecar_to_children')
  final EdgeSidecarToChildren? edgeSidecarToChildren;

  NodeData({
    this.edgeSidecarToChildren,
    required this.isVideo,
    this.videoUrl,
    this.videoDuration,
    this.dimensions,
    this.edges,
    this.typeName,
    this.displayUrl,
  });

  factory NodeData.fromJson(Map<String, dynamic> data) => _$NodeDataFromJson(data);
  Map<String, dynamic> toJson() => _$NodeDataToJson(this);
}
