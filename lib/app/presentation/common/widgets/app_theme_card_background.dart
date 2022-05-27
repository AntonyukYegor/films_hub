import 'package:films_hub/app/presentation/common/widgets/app_theme_card_background_without_shadow.dart';
import 'package:flutter/material.dart';

class AppThemeCardBackground extends StatelessWidget {
  const AppThemeCardBackground(
      this._posterUrl, this._borderRadius, this._topPadding,
      {Key? key})
      : super(key: key);
  final String _posterUrl;
  final double _borderRadius;
  final double _topPadding;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.only(top: _topPadding),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(1, 5),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child:
              AppThemeCardBackgroundWithoutShadow(_posterUrl, _borderRadius, 0),
        ),
      ),
    );
  }
}
