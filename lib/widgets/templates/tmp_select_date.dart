import 'package:flutter/material.dart';
import 'package:tech_task/widgets/molecules/mol_select_date_widget.dart';

import '../widgets.dart';

class TmpSelectDate extends StatelessWidget {
  final TextEditingController controller;
  final Function onPressedSelectDate;
  final Function onPressedShowIngredients;

  const TmpSelectDate(
      {Key key,
      this.controller,
      this.onPressedSelectDate,
      this.onPressedShowIngredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AtmAppbarPrimary(
        context,
        text: 'Launch Recipe Suggestion',
      ),
      body: MolSelectDateWidget(
        controller: controller,
        onPressedSelectDate: onPressedSelectDate,
        onPressedShowIngredients: onPressedShowIngredients,
      ),
    );
  }
}
