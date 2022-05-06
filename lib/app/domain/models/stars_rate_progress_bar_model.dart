import 'package:flutter/material.dart';

class StarsRateProgressBarModel {
  final Color backgroundColor;
  final Color foregroundColor;
  final int starsCount;
  final double progress;

  StarsRateProgressBarModel(this.backgroundColor, this.foregroundColor,
      this.starsCount, this.progress);
}
