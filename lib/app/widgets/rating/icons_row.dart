import 'package:films_hub/app/models/icons_row_model.dart';
import 'package:flutter/material.dart';

class IconsRow extends StatelessWidget {
  const IconsRow(this._model, {Key? key}) : super(key: key);

  final IconsRowModel _model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < _model.iconsCount; i++)
          FittedBox(
            fit: BoxFit.contain,
            child: Icon(
              _model.iconData,
              color: _model.iconColor,
            ),
          ),
      ],
    );
  }
}