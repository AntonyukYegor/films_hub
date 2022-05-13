import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(this.child, {required this.onPressed, Key? key})
      : super(key: key);

  final Widget child;
  final void Function() onPressed;
  final double _borderRadius = 8;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: Colors.transparent,
      ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(_borderRadius),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Padding(
            padding: EdgeInsets.all(_borderRadius),
            child: child,
          ),
        ),
      ),
    );
  }
}
