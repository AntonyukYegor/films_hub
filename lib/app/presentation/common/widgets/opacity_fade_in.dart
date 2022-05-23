import 'package:flutter/material.dart';

class OpacityFadeIn extends StatefulWidget {
  const OpacityFadeIn(
      {required Duration duration,
      required Widget Function(BuildContext context) childBuilder,
      double? startValueOpacity,
      double? endValueOpacity,
      Key? key})
      : _duration = duration,
        _startValueOpacity = startValueOpacity ?? 0,
        _endValueOpacity = endValueOpacity ?? 1,
        _childBuilder = childBuilder,
        super(key: key);

  final Widget Function(BuildContext context) _childBuilder;
  final Duration _duration;
  final double _startValueOpacity;
  final double _endValueOpacity;

  @override
  State<OpacityFadeIn> createState() => _OpacityFadeInState();
}

class _OpacityFadeInState extends State<OpacityFadeIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: widget._duration, vsync: this);
    _animation = Tween<double>(
      begin: widget._startValueOpacity,
      end: widget._endValueOpacity,
    ).animate(_animationController);
    _animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animation.value,
      child: widget._childBuilder(context),
    );
  }
}
