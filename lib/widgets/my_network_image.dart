import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_profile/utils/my_decoration.dart';
import 'package:insta_profile/widgets/shimmer_widget.dart';

class MyNetworkImage extends StatelessWidget {
  final String? urlToImage;
  final bool isCircle;
  const MyNetworkImage({Key? key, this.urlToImage, this.isCircle = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fitHeight,
      alignment: Alignment.center,
      placeholder: placeHolder,
      errorWidget: errorWidget,

      imageBuilder: (context, imageProvider) {
        return ClipRRect(
          borderRadius: isCircle ? MyDecoration.inputBorderRadius : MyDecoration.borderRadius,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        );
      },
      imageUrl: [null, ''].contains(urlToImage) ? 'https://www.tibs.org.tw/images/default.jpg' : urlToImage!,
      // imageUrl: urlToImage!,
    );
  }

  Widget placeHolder(BuildContext context, String _) => const ShimmerAnimation();
  Widget errorWidget(BuildContext context, String _, dynamic __) => const Icon(Icons.error_outline_outlined);
}
