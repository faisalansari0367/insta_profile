import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_profile/helpers/provider_helper.dart';
import 'package:insta_profile/pages/home/widgets/downloaded_files/downloaded_files.dart';
import 'package:insta_profile/provider/downloaded_files_provider.dart';
import 'package:insta_profile/services/path_provider_service.dart';
import 'package:insta_profile/widgets/my_snack_bar.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;

class DownloadFilesPage extends StatefulWidget {
  const DownloadFilesPage({Key? key}) : super(key: key);

  @override
  State<DownloadFilesPage> createState() => _DownloadFilesPageState();
}

class _DownloadFilesPageState extends State<DownloadFilesPage> with SingleTickerProviderStateMixin {
  final List<Tab> tabs = [];
  late TabController controller;
  final List<File> images = [];
  final List<File> videos = [];

  @override
  void initState() {
    final _tabs = [const Tab(text: 'Photos'), const Tab(text: 'Videos')];
    tabs.addAll(_tabs);
    controller = TabController(vsync: this, length: tabs.length);
    final provider = getProvider<DownloadedFilesProvider>(context);
    for (var element in provider.downloadedFiles) {
      final isVideo = lookupMimeType(element.path)!.split('/').first == 'video';
      if (isVideo) {
        videos.add(element);
      } else {
        images.add(element);
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: const Text('Downloaded Files'),
        bottom: TabBar(
          controller: controller,
          tabs: tabs,
          indicatorColor: Theme.of(context).primaryColor,
        ),
        actions: [IconButton(onPressed: openMenu, icon: const Icon(Icons.vertical_align_bottom))],
      ),
      body: TabBarView(
        controller: controller,
        children: [
          DownloadedFilesView(
            data: images,
          ),
          DownloadedFilesView(
            data: videos,
          ),
        ],
      ),
    );
  }

  Future<void> openMenu() async {
    // showLicensePage(context: context);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListTile(
          trailing: const Icon(Icons.upload_file_rounded),
          title: const Text('Export files'),
          onTap: startExporting,
        );
      },
    );
  }

  Future<void> startExporting() async {
    Navigator.pop(context);
    final dir = Directory('/storage/emulated/0/Insta profile');
    if (!await dir.exists()) await dir.create();
    final cacheDir = await PathProviderService.getCacheDir();
    MySnackBar.show('Export started');
    cacheDir.list().listen((event) async {
      if (event is File) {
        final filePath = p.join(dir.path, p.basename(event.path));
        final file = await File(filePath).exists();
        if (!file) await event.copy(filePath);
      }
    });
    MySnackBar.show('Export finished');
  }
}
