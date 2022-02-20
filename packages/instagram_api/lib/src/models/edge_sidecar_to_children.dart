
import 'package:json_annotation/json_annotation.dart';

import 'node.dart';

part 'edge_sidecar_to_children.g.dart';

@JsonSerializable()
class EdgeSidecarToChildren {
  @JsonKey(name: 'edges')
  final List<Node>? edges;

  EdgeSidecarToChildren({this.edges});

  factory EdgeSidecarToChildren.fromJson(Map<String, dynamic> data) => _$EdgeSidecarToChildrenFromJson(data);
  Map<String, dynamic> toJson() => _$EdgeSidecarToChildrenToJson(this);
}
