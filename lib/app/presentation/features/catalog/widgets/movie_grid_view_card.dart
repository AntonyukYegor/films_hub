import 'package:films_hub/app/domain/repositories/abstract_favourites_films_repository.dart';
import 'package:films_hub/app/presentation/common/models/movie_list_card_model.dart';
import 'package:films_hub/app/presentation/features/catalog/widgets/blur_image_background_tile.dart';
import 'package:films_hub/app/presentation/features/details/pages/details_movie_page.dart';
import 'package:films_hub/app/presentation/common/widgets/buttons/favorite_checked_button.dart';
import 'package:films_hub/app/presentation/common/widgets/buttons/primary_button.dart';
import 'package:films_hub/app/presentation/common/widgets/poster.dart';
import 'package:films_hub/app/presentation/common/widgets/rating/combine_rate.dart';
import 'package:films_hub/app/presentation/common/widgets/shimmers/app_theme_shimmer_container.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_event.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieGridViewCard extends StatelessWidget {
  final MovieCardModel cardModel;
  static const double _cardBorderRadius = 8;

  const MovieGridViewCard({Key? key, required this.cardModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, top: 0, right: 8),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Poster(cardModel.poster, _cardBorderRadius),
                    Stack(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            shadowColor: Colors.transparent,
                          ),
                          child: BlurImageBackgroundTile(
                            cardModel.poster,
                            _cardBorderRadius,
                            0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  cardModel.title,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: const Offset(0.0, 2.0),
                                        blurRadius: 3.0,
                                        color: Theme.of(context).shadowColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, bottom: 4.0),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: CombineRate(
                                      cardModel.voteAverageInPercent,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                Stack(
                  children: [
                    AppThemeShimmerContainer(
                      child: Icon(
                        Icons.circle,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      duration: 1500,
                    ),
                    const Icon(
                      Icons.info_outline,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    DetailsMoviePage.navigationPath,
                    arguments: cardModel,
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8.0),
              child: BlocBuilder<FavouritesBloc, FavouritesState>(
                builder: (context, _) => FavoriteCheckedButton(
                  key: Key(cardModel.id),
                  alignment: Alignment.center,
                  initialChecked: context
                      .read<AbstractFavouritesFilmsRepository>()
                      .checkForFavouriteById(cardModel.id),
                  onPressed: () {
                    context.read<FavouritesBloc>().add(
                          ChangedFavourite(model: cardModel),
                        );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
