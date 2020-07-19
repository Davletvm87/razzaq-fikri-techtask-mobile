import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class PageIngredients extends StatelessWidget {
  final DateTime selectedDate;

  const PageIngredients({Key key, this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TmpIngredients(selectedDate: selectedDate);
  }
}
