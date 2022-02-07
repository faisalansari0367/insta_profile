import 'package:flutter/material.dart';
import 'package:insta_profile/helpers/provider_helper.dart';
import 'package:insta_profile/pages/home/feed_images.dart';
import 'package:insta_profile/provider/insta_provider.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/widgets/my_network_image.dart';

import 'widgets/biography/biography.dart';
import 'widgets/profile_details/profile_details.dart';

class ImageAndProfileWidget extends StatelessWidget {
  const ImageAndProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = getProvider<InstaProvider>(context, listen: true);
    final userData = provider.userData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.height),
        MyNetworkImage(
          isLoading: provider.isLoading,
          onLongPress: () => provider.onLongPress(
            provider.userData!.hdImageUrl!,
            provider.userData!.userName!,
          ),
          urlToImage: provider.userData?.hdImageUrl,
        ),
        SizedBox(height: 1.height),
        ProfileDetails(
          isLoading: provider.isLoading && provider.userData == null,
          user: userData,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Biography(
            bio: userData?.biography,
            isLoading: provider.isLoading && userData?.biography == null,
          ),
        ),
        SizedBox(height: 1.height),
        
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 2.width),
        //   child: Text('Downloaded Files', style: theme.textTheme.headline6),
        // ),
        // SizedBox(height: 1.height),
        // const DownloadFilesListView(),
      ],
    );
  }
}
