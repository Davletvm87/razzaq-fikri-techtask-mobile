import 'package:flutter/material.dart';

class AtmAppbarPrimary extends AppBar {
  final Widget leading;
  final List<Widget> action;
  final BuildContext context;
  final bool automaticallyImplyLeading;
  final IconThemeData iconTheme;
  final String text;

  AtmAppbarPrimary(
    this.context, {
    @required this.text,
    this.leading,
    this.action,
    this.automaticallyImplyLeading = true,
    this.iconTheme,
  }) : super(
          elevation: 0,
          brightness: Theme.of(context).brightness,
          leading: leading,
          actions: action,
          iconTheme:
              iconTheme == null ? Theme.of(context).iconTheme : iconTheme,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: Text(
            text,
            style: Theme.of(context).textTheme.headline1,
          ),
        );
}
