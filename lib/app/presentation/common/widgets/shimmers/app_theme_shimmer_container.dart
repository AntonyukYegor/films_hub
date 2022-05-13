import 'package:films_hub/app/presentation/common/widgets/shimmers/shimmed_container.dart';
import 'package:flutter/material.dart';

class AppThemeShimmerContainer extends StatelessWidget {
  const AppThemeShimmerContainer({Key? key, this.duration, required this.child})
      : super(key: key);
  final Widget child;
  final int? duration;
  static const int _defaultDuration = 1000;

  @override
  Widget build(BuildContext context) {
    return ShimmedContainer(
      child: child,
      startColor: Theme.of(context).primaryColorLight,
      endColor: Theme.of(context).shadowColor,
      duration: Duration(milliseconds: duration ?? _defaultDuration),
    );
  }
}
