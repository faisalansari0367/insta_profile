import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/models/insta_user.dart' show InstaUser; 
import 'package:instagram_repository/instagram_repository.dart' show InstagramRepository;

part 'instagram_state.dart';

class InstagramCubit extends HydratedCubit<InstagramState> {
  InstagramCubit(this._instaRepo) : super(const InstagramState());

  final InstagramRepository _instaRepo;

  Future<void> fetchUser(String userName) async {
    try {
      emit(state.copyWith(status: UserStatus.loading));
      final InstaUser? user = await _instaRepo.getUserFromUserName(userName) as InstaUser;
      emit(state.copyWith(user: user!, status: UserStatus.success));
    } catch (e) {
      rethrow;
    }
  }

  @override
  InstagramState? fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(InstagramState state) {
    throw UnimplementedError();
  }
}
