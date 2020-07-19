import 'package:flutter/material.dart';

class AtmButtonFlatIcon extends StatelessWidget {
  final Function onPressed;
  final String text;
  final IconData icon;

  const AtmButtonFlatIcon(
      {Key key, @required this.onPressed, this.text, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      icon: Icon(icon),
      onPressed: onPressed,
      label: Text("$text"),
    );
  }
}
