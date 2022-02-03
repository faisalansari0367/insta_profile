import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_profile/gen/assets.gen.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/utils/my_decoration.dart';
import 'package:insta_profile/widgets/image_loading_placeholder.dart';
import 'package:insta_profile/widgets/shimmer_widget.dart';

class MyNetworkImage extends StatelessWidget {
  final String? urlToImage;
  final bool isLoading;
  final bool isCircle;
  final void Function()? onTap, onLongPress;
  final double? height;
  const MyNetworkImage({
    Key? key,
    this.urlToImage,
    this.isCircle = false,
    this.height,
    this.onTap,
    this.onLongPress,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ([null, ''].contains(urlToImage) && !isLoading) {
      return SvgPicture.asset(
        Assets.images.undrawStarlink3r0a,
        alignment: Alignment.center,
      );
    }
    return SizedBox(
      height: height ?? 50.height,
      child: ImageLoadingPlaceholder(
        isLoading: isLoading,
        child: [null, ''].contains(urlToImage)
            ? SvgPicture.asset(
                Assets.images.undrawStarlink3r0a,
                alignment: Alignment.center,
              )
            : GestureDetector(
                onTap: onTap,
                onLongPress: onLongPress,
                child: CachedNetworkImage(
                  placeholder: placeHolder,
                  errorWidget: errorWidget,
                  imageBuilder: imageBuilder,
                  imageUrl: urlToImage!,
                  // imageUrl: urlToImage!,
                ),
              ),
      ),
    );
  }

  Widget imageBuilder(context, imageProvider) {
    return ClipRRect(
      borderRadius: isCircle ? MyDecoration.inputBorderRadius : MyDecoration.borderRadius,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  Widget placeHolder(BuildContext context, String _) => const ShimmerAnimation();
  Widget errorWidget(BuildContext context, String _, dynamic __) => const Icon(Icons.error_outline_outlined);
}
