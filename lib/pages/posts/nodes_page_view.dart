import 'package:flutter/material.dart';
import 'package:insta_profile/models/node.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';
import 'package:insta_profile/widgets/my_network_image.dart';
import 'package:insta_profile/widgets/page_view_animation.dart';

class NodesPageView extends StatefulWidget {
  final List<Node>? nodes;
  const NodesPageView({Key? key, this.nodes}) : super(key: key);

  @override
  State<NodesPageView> createState() => _NodesPageViewState();
}

class _NodesPageViewState extends State<NodesPageView> {
  late PageController controller;
  double? pageOffset = 0;
  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      pageOffset = controller.page;
    });
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.nodes == null) return const SizedBox.shrink();
    return SizedBox(
      height: 60.height,
      child: PageView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: widget.nodes?.length ?? 0,
        itemBuilder: itemBuilder,
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final image = widget.nodes?.elementAt(index).nodeData;
    if (image?.displayUrl == null) return const SizedBox.shrink();
    return PageViewAnimation(
      controller: controller,
      index: index,
      pageOffset: pageOffset!,
      child: Stack(
        fit: StackFit.expand,
        children: [
          MyNetworkImage(
            urlToImage: image?.displayUrl,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2.padding,
                vertical: 1.padding,
              ),
              decoration: BoxDecoration(
                borderRadius: kBorderRadius,
                color: Colors.black.withOpacity(0.3),
              ),
              child: Text(
                '${index + 1} / ${widget.nodes?.length}',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.grey[200]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
