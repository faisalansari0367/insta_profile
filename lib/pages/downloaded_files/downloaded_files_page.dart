import 'package:flutter/material.dart';
import 'package:insta_profile/pages/home/widgets/downloaded_files/downloaded_files.dart';

class DownloadFilesPage extends StatelessWidget {
  const DownloadFilesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: const Text('Downloaded Files'),
      ),
      body: const DownloadedFilesPage(),
    );
  }
}


