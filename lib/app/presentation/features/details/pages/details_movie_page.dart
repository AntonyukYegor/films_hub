import 'package:films_hub/app/domain/models/movie_list_card_model.dart';
import 'package:films_hub/app/presentation/common/widgets/appbar/app_bar_flexible_space.dart';
import 'package:films_hub/app/presentation/common/widgets/app_theme_card_background.dart';
import 'package:films_hub/app/presentation/common/widgets/poster.dart';
import 'package:films_hub/app/presentation/common/widgets/rating/combine_rate.dart';
import 'package:flutter/material.dart';

class DetailsMoviePage extends StatelessWidget {
  static const navigationPath = '/details';
  final MovieCardModel _model;

  const DetailsMoviePage({Key? key, required MovieCardModel model})
      : _model = model,
        super(key: key);
  static const double _cardBorderRadius = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        flexibleSpace: const AppBarFlexibleSpace(32, "Details"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 80)),
            Container(
              margin: const EdgeInsets.only(
                  left: 16, top: 16, right: 16, bottom: 16),
              child: Stack(children: [
                AppThemeCardBackground(_model.posterLowResolution, _cardBorderRadius, 64),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 256,
                      child: Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, bottom: 16, top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Poster(_model.poster, _cardBorderRadius),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 64.0, right: 16),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: CombineRate(
                                          _model.voteAverageInPercent,
                                          height: 22,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const Text("Release:",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(_model.releaseDate,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: SizedBox(
                                          height: 16,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              FittedBox(
                                                fit: BoxFit.contain,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8),
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 4, bottom: 1),
                                                    child: Text(
                                                      _model.language,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const FittedBox(
                                                fit: BoxFit.contain,
                                                child: Icon(
                                                  Icons.language,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                    Theme(
                      data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 30),
                        child: Column(
                          children: [
                            Text(_model.title,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                )),
                            const Padding(
                              padding: EdgeInsets.only(top: 32.0),
                              child: Text("Description:",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  ' ' * 5 + _model.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            const Padding(padding: EdgeInsets.only(top: 80)),
          ],
        ),
      ),
    );
  }
}
