import 'package:films_hub/app/presentation/common/widgets/shimmers/app_theme_shimmer_container.dart';
import 'package:films_hub/app/presentation/features/catalog/widgets/movie_grid_view_card_skeleton.dart';
import 'package:flutter/material.dart';

class AppThemeGridViewMoviesCardsShimmer extends StatelessWidget {
  const AppThemeGridViewMoviesCardsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppThemeShimmerContainer(
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 2 / 2.35,
        crossAxisSpacing: 0,
        mainAxisSpacing: 24,
        children: List.generate(
            4,
            (index) => const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: MovieGridViewCardSkeleton(),
                )).toList(),
      ),
    );
  }
}
