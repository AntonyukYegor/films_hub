import 'package:films_hub/app/presentation/common/widgets/rating/models/icons_row_model.dart';
import 'package:flutter/material.dart';

class IconsRow extends StatelessWidget {
  const IconsRow(this._model, {Key? key}) : super(key: key);

  final IconsRowModel _model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          _model.iconsCount,
          (int index) => FittedBox(
            fit: BoxFit.contain,
            child: Icon(
              _model.iconData,
              color: _model.iconColor,
            ),
          ),
        ),
      ],
    );
  }
}
