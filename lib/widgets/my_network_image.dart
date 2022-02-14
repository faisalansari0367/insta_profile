import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_profile/gen/assets.gen.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';
import 'package:insta_profile/utils/my_decoration.dart';
import 'package:insta_profile/widgets/image_loading_placeholder.dart';
import 'package:insta_profile/widgets/shimmer_widget.dart';

class MyNetworkImage extends StatelessWidget {
  final String? urlToImage;
  final bool isLoading, isCircle, useImageBuilder, autoHeight;
  final void Function()? onTap, onLongPress;
  final double? height;
  final BoxFit fit;
  const MyNetworkImage({
    Key? key,
    this.isLoading = false,
    this.isCircle = false,
    this.autoHeight = false,
    this.useImageBuilder = true,
    this.urlToImage,
    this.height,
    this.onTap,
    this.onLongPress,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if ([null, ''].contains(urlToImage) && !isLoading) {
    //   return SvgPicture.asset(
    //     Assets.images.undrawStarlink3r0a,
    //     alignment: Alignment.center,
    //   );
    // }
    return SizedBox(
      height: autoHeight ? null : height ?? 50.height,
      
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
                  fit: fit,
                  placeholder: placeHolder,
                  errorWidget: errorWidget,
                  imageBuilder: useImageBuilder ? imageBuilder : null,
                  imageUrl: urlToImage!,
                  // imageUrl: urlToImage!,
                ),
              ),
      ),
    );
  }

  Widget imageBuilder(context, imageProvider) {
    return ClipRRect(
      borderRadius: isCircle ? MyDecoration.inputBorderRadius : kBorderRadius,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }

  Widget placeHolder(BuildContext context, String _) => const ShimmerAnimation();
  Widget errorWidget(BuildContext context, String _, dynamic __) => const Icon(Icons.error_outline_outlined);
}
