import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_profile/features/image_and_profile/image_and_profile_bloc.dart';
import 'package:insta_profile/features/search/search_field.dart';
import 'package:insta_profile/instagram/cubit/instagram_cubit.dart';
import 'package:insta_profile/pages/home/profile_and_image_widget.dart';
import 'package:instagram_repository/instagram_repository.dart';

class HomePageBloc extends StatelessWidget {
  const HomePageBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => InstagramRepository(),
      child: BlocProvider(
        create: (_) => InstagramCubit(context.read<InstagramRepository>()),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              BlocConsumer<InstagramCubit, InstagramState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SearchField(),
                        ImageAndProfileView(),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
