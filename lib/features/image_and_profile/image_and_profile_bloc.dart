import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_profile/instagram/cubit/instagram_cubit.dart';
import 'package:insta_profile/pages/home/widgets/biography/biography.dart';
import 'package:insta_profile/pages/home/widgets/profile_details/profile_details.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/widgets/download_button.dart';
import 'package:insta_profile/widgets/my_cross_fade.dart';
import 'package:insta_profile/widgets/my_network_image.dart';
import 'package:instagram_repository/instagram_repository.dart';

// class ImageAndProfileBloc extends StatelessWidget {
//   const ImageAndProfileBloc({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => InstagramCubit(context.read<InstagramRepository>()),
//       child: const ImageAndProfileView(),
//     );
//   }
// }

class ImageAndProfileView extends StatelessWidget {
  const ImageAndProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstagramCubit, InstagramState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.height),
            Stack(
              children: [
                MyNetworkImage(
                  isLoading: state.status.isLoading,
                  urlToImage: state.user?.hdImageUrl,
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: MyCrossFade(
                    isLoading: state.user?.hdImageUrl == null,
                    child: DownloadButton(
                      fileLink: state.user?.hdImageUrl ?? '',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.height),
            ProfileDetails(
              isLoading: state.status.isLoading && state.user == null,
              user: state.user,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Biography(
                bio: state.user?.biography,
                isLoading: state.status.isLoading && state.user?.biography == null,
              ),
            ),
            SizedBox(height: 1.height),
          ],
        );
      },
    );
  }
}
