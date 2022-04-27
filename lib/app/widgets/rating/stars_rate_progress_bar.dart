import 'package:films_hub/app/models/icons_row_model.dart';
import 'package:films_hub/app/models/stars_rate_progress_bar_model.dart';
import 'package:films_hub/app/widgets/rating/icons_row.dart';
import 'package:flutter/material.dart';

class StarsRateProgressBar extends StatelessWidget {
  final StarsRateProgressBarModel _model;

  const StarsRateProgressBar(this._model, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [
                  _model.progress,
                  0
                ],
                colors: [
                  _model.foregroundColor,
                  _model.backgroundColor,
                ]).createShader(bounds);
          },
          child: IconsRow(IconsRowModel(
            Icons.star,
            _model.starsCount,
            Colors.black,
          )),
        ),
        IconsRow(IconsRowModel(
          Icons.star_outline,
          _model.starsCount,
          _model.foregroundColor,
        )),
      ],
    );
  }
}
