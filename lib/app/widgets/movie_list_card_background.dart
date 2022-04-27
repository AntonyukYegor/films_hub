import 'package:films_hub/app/widgets/blur/symmetrical_blur.dart';
import 'package:flutter/material.dart';

class MovieListCardBackground extends StatelessWidget {
  const MovieListCardBackground(this._posterUrl, this._borderRadius, this._topPadding,  {Key? key})
      : super(key: key);
  final String _posterUrl;
  final double _borderRadius;
  final double _topPadding;
  @override
  Widget build(BuildContext context) {
    return
      Positioned.fill(
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_borderRadius),
              child: Container(
                color: Colors.white54,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                        color: Theme
                            .of(context)
                            .scaffoldBackgroundColor),
                    ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme
                                  .of(context)
                                  .primaryColor
                                  .withOpacity(0.3),
                              Theme
                                  .of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                            ]).createShader(bounds);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              width: 20),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                                _borderRadius), //         <--- border radius here
                          ),
                        ),
                        child: Opacity(
                          opacity: 0.7,
                          child: Image(
                            image: ResizeImage(
                                Image
                                    .network(
                                  _posterUrl,
                                )
                                    .image,
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
                            color: Theme
                                .of(context)
                                .primaryColor
                                .withOpacity(0.15),
                            width: 1.5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                              _borderRadius), //         <--- border radius here
                        ),
                        // color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
