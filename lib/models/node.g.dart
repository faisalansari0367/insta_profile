// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Node _$NodeFromJson(Map<String, dynamic> json) {
  return Node(
    nodeData: json['node'] == null
        ? null
        : NodeData.fromJson(json['node'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NodeToJson(Node instance) => <String, dynamic>{
      'node': instance.nodeData,
    };
