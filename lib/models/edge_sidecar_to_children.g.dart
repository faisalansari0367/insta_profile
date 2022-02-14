// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edge_sidecar_to_children.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EdgeSidecarToChildren _$EdgeSidecarToChildrenFromJson(
    Map<String, dynamic> json) {
  return EdgeSidecarToChildren(
    edges: (json['edges'] as List<dynamic>?)
        ?.map((e) => Node.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EdgeSidecarToChildrenToJson(
        EdgeSidecarToChildren instance) =>
    <String, dynamic>{
      'edges': instance.edges,
    };
