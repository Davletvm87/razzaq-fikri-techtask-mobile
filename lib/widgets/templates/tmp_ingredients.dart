import 'package:flutter/material.dart';

import '../widgets.dart';

class TmpIngredients extends StatelessWidget {
  final DateTime selectedDate;

  const TmpIngredients({Key key, this.selectedDate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AtmAppbarPrimary(context, text: 'Recipe Suggestion'),
      body: OrgIngredients(
        selectedDate: selectedDate,
      ),
      floatingActionButton: MolFabShowRecipe(),
    );
  }
}
