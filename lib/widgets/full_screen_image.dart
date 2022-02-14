import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';
import 'package:insta_profile/widgets/download_button.dart';
import 'package:insta_profile/widgets/my_annotated_region.dart';
import 'package:insta_profile/widgets/my_network_image.dart';
import 'package:insta_profile/widgets/page_view_animation.dart';

class FullScreenImage extends StatefulWidget {
  final List<String> images;
  final int index;
  const FullScreenImage({Key? key, this.images = const [], this.index = 0}) : super(key: key);

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  late PageController _controller;
  double viewportFraction = 1.0;
  // bool openFirst = true;
  // double? pageOffset = 0;

  String image = '';

  @override
  void initState() {
    image = widget.images.first;

    _controller = PageController(
      initialPage: widget.index,
      viewportFraction: viewportFraction,
    );

    super.initState();
  }

  @override
  void dispose() {
    debugPrint('full screen image controller dispose()');
    // pageOffset = 0;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      navBarColor: Colors.black,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      // key: UniqueKey(),
      child: Scaffold(
        // extendBody: true,
        // backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedSwitcher(
              duration: kDuration,
              child: Container(
                key: ValueKey<String>(image),
                height: 100.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ),
                  child: Container(
                    key: ValueKey<String>(image),
                    height: 100.height,
                  ),
                ),
              ),
            ),
            PageView.builder(
              controller: _controller,
              onPageChanged: onPageChanged,
              itemCount: widget.images.length,
              itemBuilder: itemBuilder,
            )
          ],
        ),
      ),
    );
  }

  Future<void> onPageChanged(int index) async {
    image = widget.images.elementAt(index);
    setState(() {});
    // await _controller.animateToPage(index, duration: kDuration, curve: kCurve);
  }

  Widget itemBuilder(context, index) {
    var image = widget.images[index];

    final stack = Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        ClipRRect(
          borderRadius: kBorderRadius,
          child: MyNetworkImage(
            urlToImage: image,
            fit: BoxFit.fitHeight,
            autoHeight: true,
            useImageBuilder: false,
          ),
        ),
        Positioned(
          bottom: 3.padding,
          right: 3.padding,
          child: DownloadButton(
            size: 5.padding,
            fileLink: image,
          ),
          // ),
        ),
        // Center(
        //   child: PlayPauseButton(onPressed: (p0) {}),
        // ),
      ],
    );

    return PageViewAnimation(
      controller: _controller,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Container(
          // color: Colors.black.withOpacity(0.2),
          child: stack,
        ),
      ),
      index: index,
    );
  }
}
