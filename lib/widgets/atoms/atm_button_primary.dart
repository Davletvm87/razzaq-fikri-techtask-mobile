import 'package:flutter/material.dart';

class AtmButtonPrimary extends StatelessWidget {
  final Function onPressed;
  final double borderRadius;
  final String text;
  final double width;
  final double height;
  final double elevation;

  const AtmButtonPrimary({
    Key key,
    @required this.onPressed,
    this.borderRadius = 4,
    @required this.text,
    this.width = double.infinity,
    this.height = 46,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
        elevation: elevation,
      ),
    );
  }
}
