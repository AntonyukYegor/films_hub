import 'package:flutter/material.dart';

class IconCheckedButton extends StatefulWidget {
  const IconCheckedButton({
    required this.onPressed,
    required this.backgroundIcon,
    required this.foregroundIcon,
    required this.backgroundColorChecked,
    required this.backgroundColorUnchecked,
    required this.initialChecked,
    required this.padding,
    required this.alignment,
    double scale = 1,
    Key? key,
  }) : _scale = scale, super(key: key);

  final IconData backgroundIcon;
  final IconData foregroundIcon;

  final Color backgroundColorChecked;
  final Color backgroundColorUnchecked;
  final bool initialChecked;
  final EdgeInsets padding;
  final Alignment alignment;
  final void Function(bool value) onPressed;
  final double _scale;
  @override
  State<IconCheckedButton> createState() => _IconCheckedButtonState();
}

class _IconCheckedButtonState extends State<IconCheckedButton> {
  bool icChecked = false;
  static const double defaultIconWidth = 20;
  static const double defaultContainerWidth = 40;

  @override
  void initState() {
    icChecked = widget.initialChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          icChecked = !icChecked;
        }),
        widget.onPressed(icChecked)
      },
      child: Container(
        color: Colors.transparent,
        child: SizedBox(
          height: defaultContainerWidth*widget._scale,
          width: defaultContainerWidth*widget._scale,
          child: Padding(
            padding: EdgeInsets.zero, // widget.padding,
            child: Stack(
              alignment: widget.alignment,
              children: [
                Icon(
                  widget.backgroundIcon,
                  color: icChecked
                      ? widget.backgroundColorChecked
                      : widget.backgroundColorUnchecked,
                  size: defaultIconWidth*widget._scale,
                ),
                Icon(
                  widget.foregroundIcon,
                  size: defaultIconWidth*widget._scale,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
