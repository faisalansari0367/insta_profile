import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_profile/instagram/cubit/instagram_cubit.dart';
import 'package:insta_profile/widgets/my_text_field.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<InstagramCubit, InstagramState>(
      builder: (context, state) {
        return MyTextField(
          prefixIcon: Icon(Icons.search, color: theme.iconTheme.color!),
          hintText: 'Search username',
          onSubmitted: context.read<InstagramCubit>().fetchUser,
        );
      },
    );
  }
}
