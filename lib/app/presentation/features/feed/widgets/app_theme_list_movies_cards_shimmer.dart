import 'package:films_hub/app/presentation/common/widgets/shimmers/app_theme_shimmer_container.dart';
import 'package:films_hub/app/presentation/features/feed/widgets/movie_list_card_skeleton.dart';
import 'package:flutter/material.dart';

class AppThemeListMoviesCardsShimmer extends StatelessWidget {
  const AppThemeListMoviesCardsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppThemeShimmerContainer(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const MovieListCardSkeleton();
        },
        itemCount: 3,
      ),
    );
  }
}
