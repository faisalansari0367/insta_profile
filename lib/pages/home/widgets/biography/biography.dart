import 'package:flutter/material.dart';
import 'package:insta_profile/pages/home/widgets/biography/biography_placeholder.dart';
import 'package:insta_profile/theme/constans.dart';

class Biography extends StatelessWidget {
  final String? bio;
  final bool isLoading;
  const Biography({Key? key, this.bio, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: kDuration,
      crossFadeState: isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      secondChild: const BiographyPlaceholder(),
      firstChild: [null, ''].contains(bio)
          ? const SizedBox.shrink()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Bio'),
                Text(bio ?? ''),
              ],
            ),
    );
  }
}
