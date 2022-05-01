import 'package:films_hub/app/presentation/common/widgets/image_network.dart';
import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  const Poster(this._posterUrl, this._borderRadius, {Key? key})
      : super(key: key);
  final String _posterUrl;
  final double _borderRadius;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).shadowColor,
              offset: const Offset(0, 5),
              blurRadius: 10,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(_borderRadius),
              child: ShaderMask(
                blendMode: BlendMode.plus,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.1),
                        Colors.transparent,
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.25),
                        Colors.transparent,
                      ]).createShader(bounds);
                },
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: ImageNetwork(_posterUrl, fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                    width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(_borderRadius),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
