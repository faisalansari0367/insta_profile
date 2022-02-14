import 'package:json_annotation/json_annotation.dart';

part 'dimensions.g.dart';

@JsonSerializable()
class Dimensions {
  final int? height;
  final int? width;

  Dimensions({this.height, this.width});

  factory Dimensions.fromJson(Map<String, dynamic> data) => _$DimensionsFromJson(data);
  Map<String, dynamic> toJson() => _$DimensionsToJson(this);
}
