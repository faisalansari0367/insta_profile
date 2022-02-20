import 'package:json_annotation/json_annotation.dart';

import 'node.dart';

part 'edges.g.dart';

@JsonSerializable()
class Edges {
  @JsonKey(name: 'edges')
  final List<Node>? nodes;

  Edges({this.nodes});

  factory Edges.fromJson(Map<String, dynamic> data) => _$EdgesFromJson(data);
  Map<String, dynamic> toJson() => _$EdgesToJson(this);
}
