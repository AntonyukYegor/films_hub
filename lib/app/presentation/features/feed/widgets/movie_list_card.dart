import 'package:films_hub/app/domain/models/movie_list_card_model.dart';
import 'package:films_hub/app/presentation/features/details/pages/details_movie_page.dart';
import 'package:films_hub/app/presentation/common/widgets/buttons/favorite_checked_transparent_button.dart';
import 'package:films_hub/app/presentation/common/widgets/buttons/primary_button.dart';
import 'package:films_hub/app/presentation/common/widgets/app_theme_card_background.dart';
import 'package:films_hub/app/presentation/common/widgets/poster.dart';
import 'package:films_hub/app/presentation/common/widgets/rating/combine_rate.dart';
import 'package:films_hub/app/presentation/features/feed/widgets/short_details_movie.dart';
import 'package:flutter/material.dart';

class MovieListCard extends StatelessWidget {
  final MovieCardModel cardModel;
  static const double _cardBorderRadius = 8;

  const MovieListCard({Key? key, required this.cardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
      child: Stack(children: [
        AppThemeCardBackground(cardModel.posterLowResolution, _cardBorderRadius, 32),
        Column(
          children: [
            SizedBox(
              height: 160,
              child: Stack(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, bottom: 16, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Poster(cardModel.poster, _cardBorderRadius),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 32.0, right: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(cardModel.title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.0, right: 0),
                                    child: SizedBox(
                                      height: 40,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: FavoriteCheckedTransparentButton(
                                          initialChecked: false,
                                          alignment: Alignment.topRight,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child:
                                    CombineRate(cardModel.voteAverageInPercent),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 105.0),
          child: Theme(
            data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: ExpansionTile(
              iconColor:
                  Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(1),
              backgroundColor: Colors.transparent,
              collapsedBackgroundColor: Colors.transparent,
              title: const SizedBox(),
              children: <Widget>[
                ShortDetailsMovie(
                  cardModel.language,
                  cardModel.description,
                ),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    const Center(
                      child: Text('More'),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        DetailsMoviePage.navigationPath,
                        arguments: cardModel,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
