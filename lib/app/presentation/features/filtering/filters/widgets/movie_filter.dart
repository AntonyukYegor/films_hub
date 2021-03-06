import 'package:films_hub/app/components/constants.dart';
import 'package:films_hub/app/components/locals/locals.dart';
import 'package:films_hub/app/domain/models/films/abstract_film.dart';
import 'package:films_hub/app/domain/models/filters/abstract_filter.dart';
import 'package:films_hub/app/domain/models/filters/films/film_future_list_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/bloc/filters_bloc.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/bloc/filters_event.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/widgets/film_contains_pattern_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/widgets/film_language_filter.dart';
import 'package:films_hub/app/presentation/features/filtering/filters/widgets/film_vote_average_slider_filter.dart';
import 'package:films_hub/app/presentation/common/widgets/app_theme_card_background.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieFilter extends StatefulWidget {
  const MovieFilter(this._onApply, {Key? key}) : super(key: key);
  final void Function(AbstractFilter<Future<List<AbstractFilm>>>) _onApply;

  @override
  State<MovieFilter> createState() => _MovieFilterState();
}

class _MovieFilterState extends State<MovieFilter>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<FilmLanguageFilterState> _keyLanguageFilter = GlobalKey();
  final GlobalKey<FilmVoteAverageSliderFilterState> _keyVoteAverageFilter =
      GlobalKey();
  final GlobalKey<FilmContainsPatternFilterState> _keyTextContainsFilter =
      GlobalKey();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(children: [
      const AppThemeCardBackground(AppStyle.randomBackgroundImageUrl, 8, 0),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: ExpansionTile(
                initiallyExpanded: context.read<FiltersBloc>().state.isExpanded,
                onExpansionChanged: (value) {
                  if (value == false) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                  context.read<FiltersBloc>().add(ChangeWidgetExpandedEvent(isExpanded: value));
                },
                maintainState: true,
                iconColor: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color
                        ?.withOpacity(1) ??
                    Colors.black,
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                title: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        context.locale.filtering.title,
                        style: TextStyle(
                          color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.color
                                  ?.withOpacity(1) ??
                              Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                childrenPadding: const EdgeInsets.only(
                    left: 16, top: 8, right: 16, bottom: 8),
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          context.locale.filtering.byPattern,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: FilmContainsPatternFilter(
                              key: _keyTextContainsFilter),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          context.locale.filtering.byLanguage,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ShaderMask(
                          blendMode: BlendMode.dstIn,
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [
                                  0,
                                  0.05,
                                  0.95,
                                  1
                                ],
                                colors: [
                                  Colors.transparent,
                                  Colors.white,
                                  Colors.white,
                                  Colors.transparent,
                                ]).createShader(bounds);
                          },
                          child: FilmLanguageFilter(key: _keyLanguageFilter),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        context.locale.filtering.byRating,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: FilmVoteAverageSliderFilter(
                            key: _keyVoteAverageFilter),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ElevatedButton(
                            onPressed: resetFilters,
                            child: Text(context.locale.filtering.reset),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: ElevatedButton(
                            onPressed: onPressedApply,
                            child: Text( context.locale.filtering.apply),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ]);
  }

  Future<void> onPressedApply() async {
    var languageFilter = _keyLanguageFilter.currentState?.filter();
    var voteAverageFilter = _keyVoteAverageFilter.currentState?.filter();
    var textContainsFilter = _keyTextContainsFilter.currentState?.filter();

    var filters = [
      textContainsFilter,
      languageFilter,
      voteAverageFilter,
    ].whereNotNull().toList();
    var resultFilter = FilmFutureListFilter(filters);
    widget._onApply(resultFilter);
  }

  void resetFilters() {
    setState(() {
      _keyLanguageFilter.currentState?.reset();
      _keyVoteAverageFilter.currentState?.reset();
      _keyTextContainsFilter.currentState?.reset();
    });
  }
}
