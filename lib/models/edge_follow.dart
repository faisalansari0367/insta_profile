import 'package:json_annotation/json_annotation.dart';

part 'edge_follow.g.dart';

@JsonSerializable()
class EdgeFollow {
  @JsonKey(defaultValue: 0)
  final int count;

  const EdgeFollow({required this.count});

  factory EdgeFollow.fromJson(Map<String, dynamic> data) => _$EdgeFollowFromJson(data);
  Map<String, dynamic> toJson() => _$EdgeFollowToJson(this);
}
