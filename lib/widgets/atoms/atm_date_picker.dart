import 'package:flutter/material.dart';

class AtmDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final String labelText;
  final Function onTap;

  const AtmDatePicker(
      {Key key,
      this.controller,
      this.readOnly = true,
      this.textAlign = TextAlign.center,
      this.textStyle,
      @required this.labelText,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      textAlign: textAlign,
      style:
          textStyle == null ? Theme.of(context).textTheme.bodyText1 : textStyle,
      decoration:
          InputDecoration(labelText: labelText, border: OutlineInputBorder()),
      onTap: onTap,
    );
  }
}
