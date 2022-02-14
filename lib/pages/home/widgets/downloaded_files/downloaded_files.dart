import 'dart:io';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insta_profile/helpers/redirect.dart';
import 'package:insta_profile/provider/downloaded_files_provider.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';
import 'package:insta_profile/widgets/my_annotated_region.dart';
import 'package:insta_profile/widgets/my_grid_view.dart';
import 'package:insta_profile/widgets/page_view_animation.dart';
import 'package:provider/provider.dart';

class DownloadedFilesPage extends StatelessWidget {
  const DownloadedFilesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DownloadedFilesProvider>(context);
    if (provider.downloadedFiles.isEmpty) return const SizedBox.shrink();

    return MyGridView(
      // shrinkWrap: true,
      padding: kMargin,
      data: provider.downloadedFiles,            
      physics: kPhysics,
      itemBuilder: itemBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final provider = Provider.of<DownloadedFilesProvider>(context);

    final file = provider.downloadedFiles.elementAt(index);
    final size = 15.image.toInt();
    return InkWell(
      onTap: () => Redirect.to(
        context,
        OpenDownloadedImage(
          images: provider.downloadedFiles,
          index: index,
        ),
      ),
      child: ClipRRect(
        borderRadius: kBorderRadius,
        child: Image.file(
          file,
          width: size.toDouble(),
          cacheWidth: size * 3,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class OpenDownloadedImage extends StatefulWidget {
  final List<File> images;
  final int index;
  const OpenDownloadedImage({Key? key, required this.images, this.index = 0}) : super(key: key);

  @override
  _OpenDownloadedImageState createState() => _OpenDownloadedImageState();
}

class _OpenDownloadedImageState extends State<OpenDownloadedImage> {
  late PageController _controller;
  late File image;

  @override
  void initState() {
    image = widget.images[widget.index];
    _controller = PageController(initialPage: widget.index);
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
                key: ValueKey<String>(image.path),
                height: 100.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.file(image).image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ),
                  child: Container(
                    key: ValueKey<String>(image.path),
                    height: 100.height,
                  ),
                ),
              ),
            ),
            PageView.builder(
              dragStartBehavior: DragStartBehavior.start,
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

  Widget itemBuilder(BuildContext context, int index) {
    final image = widget.images.elementAt(index);

    return PageViewAnimation(
      controller: _controller,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: ClipRRect(
          borderRadius: kBorderRadius,
          child: Image.file(
            image,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      index: index,
    );
  }
}
