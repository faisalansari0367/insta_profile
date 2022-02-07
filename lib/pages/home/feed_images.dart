import 'package:flutter/material.dart';
import 'package:insta_profile/widgets/my_network_image.dart';

class FeedImages extends StatelessWidget {
  final List<String> feedImages;
  const FeedImages({Key? key, this.feedImages = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedImages.length,
      itemBuilder: (BuildContext context, int index) {
        return MyNetworkImage(
          // height: 60.height,
          // onTap: () => OpenFile.open(filePath),
          urlToImage: feedImages[index],
        );
      },
    );
  }
}
