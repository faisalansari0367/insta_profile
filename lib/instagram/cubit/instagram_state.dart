part of 'instagram_cubit.dart';

enum UserStatus { initial, loading, success, failure }

extension WeatherStatusX on UserStatus {
  bool get isInitial => this == UserStatus.initial;
  bool get isLoading => this == UserStatus.loading;
  bool get isSuccess => this == UserStatus.success;
  bool get isFailure => this == UserStatus.failure;
}

// abstract class InstagramState extends Equatable {
//   // const InstagramState({this.user = const InstaUser(), this.userStatus = UserStatus.initial, });

//   // final InstaUser? user;
//   // final UserStatus userStatus;

//   @override
//   List<Object> get props => [];
// }

class InstagramState extends Equatable {
  const InstagramState({
    this.user,
    this.status = UserStatus.initial,
  });

  final InstaUser? user;
  final UserStatus status;

  InstagramState copyWith({InstaUser? user, UserStatus? status}) {
    return InstagramState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }

  @override
  InstagramState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(InstagramState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [user, status];
}
