import 'package:json_annotation/json_annotation.dart';

part 'edge_followed_by.g.dart';

@JsonSerializable()
class EdgeFollowedBy {
  @JsonKey(defaultValue: 0)
  final int count;

  const EdgeFollowedBy({required this.count});

  factory EdgeFollowedBy.fromJson(Map<String, dynamic> data) => _$EdgeFollowedByFromJson(data);
  Map<String, dynamic> toJson() => _$EdgeFollowedByToJson(this);
}
