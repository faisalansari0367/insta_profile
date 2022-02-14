import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:insta_profile/models/node.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';
import 'package:insta_profile/widgets/download_button.dart';
import 'package:insta_profile/widgets/my_network_image.dart';
import 'package:insta_profile/widgets/video_player.dart';

import 'nodes_page_view.dart';

class PostsPage extends StatefulWidget {
  final List<Node>? videos;
  final List<Node>? posts;
  const PostsPage({Key? key, this.videos, this.posts}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> with SingleTickerProviderStateMixin {
  final List<Tab> tabs = [];
  late TabController controller;
  final videoPlayerController = BetterPlayerListVideoPlayerController();

  @override
  void initState() {
    final _tabs = [const Tab(text: 'Videos'), const Tab(text: 'Posts')];
    tabs.addAll(_tabs);
    controller = TabController(vsync: this, length: tabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        bottom: TabBar(
          controller: controller,
          tabs: tabs,
          indicatorColor: Theme.of(context).primaryColor,
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          PageView.builder(
            physics: kPhysics,
            // padding: kMargin,
            itemCount: widget.videos?.length ?? 0,
            itemBuilder: videoItemBuilder,
            scrollDirection: Axis.vertical,
            // separatorBuilder: seperatorBuilder,
          ),
          ListView.separated(
            physics: kPhysics,
            padding: kMargin,
            itemCount: widget.posts?.length ?? 0,
            itemBuilder: itemBuilder,
            separatorBuilder: seperatorBuilder,
          )
        ],
      ),
    );
  }

  Widget seperatorBuilder(context, index) => SizedBox(height: 1.height);

  Widget videoItemBuilder(BuildContext context, int index) {
    final video = widget.videos![index].nodeData;
    final width = video?.dimensions?.width ?? 100.width;
    final height = video?.dimensions?.height ?? 70.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        VideoPlayer(
          aspectRatio: width / height,
          videoUrl: video!.videoUrl!,
          controller: videoPlayerController,
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: DownloadButton(
            fileLink: video.videoUrl!,
            isVideo: video.isVideo,
          ),
        ),
      ],
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final image = widget.posts?.elementAt(index).nodeData;
    final width = image?.dimensions?.width ?? 100.width;
    final height = image?.dimensions?.height ?? 70.height;
    if (image?.edgeSidecarToChildren == null) {
      return AspectRatio(
        // height: image?.dimensions?.height?.toDouble() ?? 60.height,
        aspectRatio: width / height,
        child: MyNetworkImage(
          urlToImage: image?.displayUrl,
        ),
      );
    }
    return NodesPageView(
      nodes: image?.edgeSidecarToChildren?.edges,
    );
  }
}
