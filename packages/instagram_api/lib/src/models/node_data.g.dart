// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeData _$NodeDataFromJson(Map<String, dynamic> json) {
  return NodeData(
    edgeSidecarToChildren: json['edge_sidecar_to_children'] == null
        ? null
        : EdgeSidecarToChildren.fromJson(json['edge_sidecar_to_children'] as Map<String, dynamic>),
    isVideo: json['is_video'] as bool? ?? false,
    videoUrl: json['video_url'] as String?,
    videoDuration: (json['video_duration'] as num?)?.toDouble() ?? 0.0,
    dimensions: json['dimensions'] == null ? null : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
    edges: json['edges'] == null ? null : Edges.fromJson(json['edges'] as Map<String, dynamic>),
    typeName: json['__typename'] as String?,
    displayUrl: json['display_url'] as String?,
  );
}

Map<String, dynamic> _$NodeDataToJson(NodeData instance) => <String, dynamic>{
      '__typename': instance.typeName,
      'display_url': instance.displayUrl,
      'is_video': instance.isVideo,
      'video_url': instance.videoUrl,
      'video_duration': instance.videoDuration,
      'dimensions': instance.dimensions,
      'edges': instance.edges,
      'edge_sidecar_to_children': instance.edgeSidecarToChildren,
    };
