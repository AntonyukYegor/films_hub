import 'package:films_hub/app/presentation/common/widgets/buttons/icon_checked_button.dart';
import 'package:flutter/material.dart';

class FavoriteCheckedButton extends StatelessWidget {
  const FavoriteCheckedButton(
      {Key? key, required this.initialChecked, required this.alignment, required this.onPressed, double scale = 1})
      : _scale = scale, super(key: key);
  final bool initialChecked;
  final Alignment alignment;
  final void Function() onPressed;
  final double _scale;

  @override
  Widget build(BuildContext context) {
    return IconCheckedButton(
      onPressed: onPressed,
      initialChecked: initialChecked,
      foregroundIcon: Icons.favorite_outline,
      backgroundIcon: Icons.favorite,
      backgroundColorUnchecked: Theme.of(context).scaffoldBackgroundColor,
      backgroundColorChecked: Colors.red,
      padding: const EdgeInsets.all(16),
      alignment: alignment,
      scale: _scale,
    );
  }
}
