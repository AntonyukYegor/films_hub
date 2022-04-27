import 'dart:ui';
import 'package:flutter/material.dart';

class SymmetricalBlur extends StatelessWidget {
  static const double _frostSigma = 20;
  final double _sigma;

  const SymmetricalBlur(
    this._sigma, {
    Key? key,
  }) : super(key: key);

  const SymmetricalBlur.frost({
    Key? key,
  }) : this(_frostSigma, key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: _sigma,
        sigmaY: _sigma,
      ),
      child: Container(),
    );
  }
}
