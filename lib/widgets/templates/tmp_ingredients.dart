import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets.dart';

class TmpIngredients extends StatefulWidget {
  final DateTime selectedDate;
  final Function onBackPressed;

  const TmpIngredients({Key key, this.selectedDate, this.onBackPressed})
      : super(key: key);

  @override
  _TmpIngredientsState createState() => _TmpIngredientsState();
}

class _TmpIngredientsState extends State<TmpIngredients> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.onBackPressed,
      child: Scaffold(
        appBar: AtmAppbarPrimary(
          context,
          text: 'Recipe Suggestion',
          leading: IconButton(
            icon: Platform.isIOS
                ? Icon(Icons.arrow_back_ios)
                : Icon(Icons.arrow_back),
            onPressed: widget.onBackPressed,
          ),
        ),
        body: OrgIngredients(
          selectedDate: widget.selectedDate,
        ),
        floatingActionButton: MolFabShowRecipe(),
      ),
    );
  }
}
