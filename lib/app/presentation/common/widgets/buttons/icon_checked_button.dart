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
    Key? key,
  }) : super(key: key);

  final IconData backgroundIcon;
  final IconData foregroundIcon;

  final Color backgroundColorChecked;
  final Color backgroundColorUnchecked;
  final bool initialChecked;
  final EdgeInsets padding;
  final Alignment alignment;
  final void Function(bool value) onPressed;

  @override
  State<IconCheckedButton> createState() => _IconCheckedButtonState();
}

class _IconCheckedButtonState extends State<IconCheckedButton> {
  bool icChecked = false;

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
          height: 40,
          width: 40,
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
                ),
                Icon(
                  widget.foregroundIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
