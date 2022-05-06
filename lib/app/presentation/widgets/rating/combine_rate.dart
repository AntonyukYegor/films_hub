import 'package:films_hub/app/domain/models/stars_rate_progress_bar_model.dart';
import 'package:films_hub/app/presentation/widgets/rating/stars_rate_progress_bar.dart';
import 'package:flutter/material.dart';

class CombineRate extends StatelessWidget {
  const CombineRate(this._percent, {Key? key}) : super(key: key);
  final double _percent;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.stretch,
        children: [
          StarsRateProgressBar(
            StarsRateProgressBarModel(
              Colors.transparent,
              Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.color
                  ?.withOpacity(1) ??
                  Colors.black,
              5,
              _percent,
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding:
              const EdgeInsets.only(left: 8),
              child: Container(
                margin: const EdgeInsets.only(
                    top: 4, bottom: 1),
                child: Text(
                  (_percent*10).toStringAsFixed(1),
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
