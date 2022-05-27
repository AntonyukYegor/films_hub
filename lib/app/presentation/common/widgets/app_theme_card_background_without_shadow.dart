import 'package:films_hub/app/presentation/common/widgets/blur/symmetrical_blur.dart';
import 'package:flutter/material.dart';

class AppThemeCardBackgroundWithoutShadow extends StatelessWidget {
  const AppThemeCardBackgroundWithoutShadow(
      this._posterUrl, this._borderRadius, this._topPadding,
      {Key? key})
      : super(key: key);
  final String _posterUrl;
  final double _borderRadius;
  final double _topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _topPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_borderRadius),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: Theme.of(context).scaffoldBackgroundColor),
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.3),
                      Theme.of(context).primaryColor.withOpacity(0.1),
                    ]).createShader(bounds);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 20),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                        _borderRadius),
                  ),
                ),
                child: Opacity(
                  opacity: 0.7,
                  child: Image(
                    image: ResizeImage(
                        Image.network(
                          _posterUrl,
                        ).image,
                        width: 4,
                        height: 2),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SymmetricalBlur.frost(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color:
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(_borderRadius),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
