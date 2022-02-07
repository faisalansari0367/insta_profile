import 'package:flutter/material.dart';
import 'package:insta_profile/extensions/int_extensions.dart';
import 'package:insta_profile/provider/downloaded_files_provider.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/utils/my_decoration.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';

import 'downloaded_file.dart';

class DownloadFilesListView extends StatelessWidget {
  const DownloadFilesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DownloadedFilesProvider>(context);
    if (provider.downloadedFiles.isEmpty) return const SizedBox.shrink();

    return ListView.builder(
      itemCount: provider.downloadedFiles.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final file = provider.downloadedFiles.elementAt(index);
        return DownloadedFile(
          title: Text(p.basename(file.path)),
          description: Text(file.statSync().size.formatBytes()),
          leading: ClipRRect(
            borderRadius: MyDecoration.inputBorderRadius,
            child: Image.file(
              file,
              height: 13.image,
              width: 13.image,
            ),
          ),
        );
      },
    );
  }
}
