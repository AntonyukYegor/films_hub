import 'package:films_hub/app/components/constants.dart';
import 'package:films_hub/app/presentation/common/widgets/blur/symmetrical_blur.dart';
import 'package:films_hub/app/presentation/common/widgets/opacity_fade_in.dart';
import 'package:flutter/material.dart';

class BlurImageBackgroundTile extends StatelessWidget {
  const BlurImageBackgroundTile(
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Container(
            color: Colors.white54,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(color: Theme.of(context).scaffoldBackgroundColor),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        _borderRadius,
                      ),
                    ),
                  ),
                  child: OpacityFadeIn(
                    childBuilder: (_) => Image(
                      image: ResizeImage(
                          Image.network(
                            _posterUrl,
                          ).image,
                          width: 4,
                          height: 2),
                      fit: BoxFit.fill,
                    ),
                    duration: AppStyle.blurBackgroundFadeAnimationDuration,
                    endValueOpacity: 0.7,
                  ),
                ),
                const SymmetricalBlur.frost(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                          _borderRadius),
                    ),
                    // color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
