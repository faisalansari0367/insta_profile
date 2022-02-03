import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insta_user.g.dart';

@JsonSerializable()
class InstaUser extends Equatable {
  final String? userName, imageUrl, hdImageUrl, biography, fullName;
  final int? followers, following, id;
  const InstaUser({
    this.biography,
    this.id,
    this.followers,
    this.following,
    this.fullName,
    this.hdImageUrl,
    this.imageUrl,
    this.userName,
  });

  factory InstaUser.fromJson(Map<String, dynamic> data) => _$InstaUserFromJson(data);
  Map<String, dynamic> toJson() => _$InstaUserToJson(this);

  @override
  List<Object?> get props => [userName, imageUrl, hdImageUrl, followers, following, fullName];
}
