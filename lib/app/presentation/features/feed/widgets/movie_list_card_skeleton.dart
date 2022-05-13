import 'package:flutter/material.dart';

class MovieListCardSkeleton extends StatelessWidget {
  const MovieListCardSkeleton({Key? key}) : super(key: key);
  final double _borderRadius = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      _borderRadius,
                    ),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      offset: const Offset(0, 5),
                      blurRadius: 10,
                      spreadRadius: 4,
                    ),
                  ],
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 160,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, bottom: 16, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 3 / 4,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_borderRadius),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Theme.of(context).shadowColor,
                                    offset: const Offset(0, 5),
                                    blurRadius: 10,
                                    spreadRadius: 4,
                                  ),
                                ],
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
