// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edges.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Edges _$EdgesFromJson(Map<String, dynamic> json) {
  return Edges(
    nodes: (json['edges'] as List<dynamic>?)
        ?.map((e) => Node.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EdgesToJson(Edges instance) => <String, dynamic>{
      'edges': instance.nodes,
    };
