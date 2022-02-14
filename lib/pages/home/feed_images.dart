import 'package:flutter/material.dart';
import 'package:insta_profile/helpers/redirect.dart';
import 'package:insta_profile/widgets/full_screen_image.dart';
import 'package:insta_profile/widgets/my_grid_view.dart';
import 'package:insta_profile/widgets/my_network_image.dart';

class FeedImages extends StatelessWidget {
  final List<String> feedImages;
  const FeedImages({Key? key, this.feedImages = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyGridView(
      data: feedImages,
      itemBuilder: itemBuilder,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return MyNetworkImage(
      onTap: () => Redirect.to(
        context,
        FullScreenImage(
          images: feedImages,
          index: index,
        ),
      ),
      urlToImage: feedImages[index],
    );
  }
}
