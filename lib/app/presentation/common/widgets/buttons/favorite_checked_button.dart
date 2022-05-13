import 'package:films_hub/app/presentation/common/widgets/buttons/icon_checked_button.dart';
import 'package:flutter/material.dart';

class FavoriteCheckedButton extends StatelessWidget {
  const FavoriteCheckedButton(
      {Key? key, required this.initialChecked, required this.alignment})
      : super(key: key);
  final bool initialChecked;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return IconCheckedButton(
      onPressed: (bool value) {},
      initialChecked: false,
      foregroundIcon: Icons.favorite_outline,
      backgroundIcon: Icons.favorite,
      backgroundColorUnchecked: Theme.of(context).scaffoldBackgroundColor,
      backgroundColorChecked: Colors.red,
      padding: const EdgeInsets.all(16),
      alignment: alignment,
    );
  }
}
