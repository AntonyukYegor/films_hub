import 'package:films_hub/app/presentation/common/widgets/rating/models/stars_rate_progress_bar_model.dart';
import 'package:films_hub/app/presentation/common/widgets/rating/stars_rate_progress_bar.dart';
import 'package:flutter/material.dart';

class CombineRate extends StatelessWidget {
  const CombineRate(this._percent, {Key? key, this.height = 16})
      : super(key: key);
  final double _percent;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StarsRateProgressBar(
            StarsRateProgressBarModel(
              Colors.transparent,
              Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(1) ??
                  Colors.black,
              5,
              _percent,
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                margin: const EdgeInsets.only(top: 4, bottom: 1),
                child: Text(
                  (_percent * 10).toStringAsFixed(1),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
