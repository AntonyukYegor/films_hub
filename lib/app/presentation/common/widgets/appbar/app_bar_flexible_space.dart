import 'package:films_hub/app/presentation/widgets/blur/symmetrical_blur.dart';
import 'package:flutter/material.dart';

class AppBarFlexibleSpace extends StatelessWidget {
  const AppBarFlexibleSpace(this._appBarBorderRadius, this._title, {Key? key})
      : super(key: key);

  final double _appBarBorderRadius;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_appBarBorderRadius),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(0, 5),
                blurRadius: 15,
                spreadRadius: 4,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(_appBarBorderRadius),
                bottomRight: Radius.circular(_appBarBorderRadius)),
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(_appBarBorderRadius),
                      bottomRight: Radius.circular(_appBarBorderRadius),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: _appBarBoxDecoration(
                            Theme.of(context).primaryColorDark.withOpacity(0.2),
                            20,
                            _appBarBorderRadius,
                          ),
                        ),
                        const SymmetricalBlur.frost(),
                        ShaderMask(
                          blendMode: BlendMode.dstIn,
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.white,
                                ]).createShader(bounds);
                          },
                          child: Container(
                            decoration: _appBarBoxDecoration(
                              Theme.of(context).primaryColor.withOpacity(0.3),
                              1.5,
                              _appBarBorderRadius,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    _title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Container(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

BoxDecoration _appBarBoxDecoration(
    Color color, double width, double borderRadius) {
  return BoxDecoration(
    border: Border.all(color: color, width: width),
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    ),
  );
}
