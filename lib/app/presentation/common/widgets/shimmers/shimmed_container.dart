import 'package:flutter/material.dart';

class ShimmedContainer extends StatefulWidget {
  const ShimmedContainer(
      {Key? key,
      required this.child,
      required this.startColor,
      required this.endColor,
      required this.duration})
      : super(key: key);

  final Widget child;
  final Color startColor;
  final Color endColor;
  final Duration duration;

  @override
  State<ShimmedContainer> createState() => _ShimmedContainerState();
}

class _ShimmedContainerState extends State<ShimmedContainer>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: widget.duration, vsync: this);
    _animation =
        Tween<double>(begin: 0.0, end: 1).animate(_animationController);
    _animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ShaderMask(
      // blendMode: BlendMode.plus,
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          tileMode: TileMode.repeated,
          stops: [
            0,
            _animation.value,
            1,
          ],
          colors: [
            widget.endColor,
            widget.startColor,
            widget.endColor,
          ],
        ).createShader(bounds);
      },
      child: widget.child,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
