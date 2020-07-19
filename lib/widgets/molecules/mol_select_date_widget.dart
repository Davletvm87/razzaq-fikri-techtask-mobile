import 'package:flutter/material.dart';

import '../widgets.dart';

class MolSelectDateWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function onPressedSelectDate;
  final Function onPressedShowIngredients;

  const MolSelectDateWidget(
      {Key key,
      this.controller,
      this.onPressedSelectDate,
      this.onPressedShowIngredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AtmDatePicker(
            controller: controller,
            labelText: 'Select Lunch Date',
            onTap: onPressedSelectDate,
          ),
          SizedBox(height: 16),
          AtmButtonPrimary(
            text: 'Show Ingredients',
            onPressed: onPressedShowIngredients,
          ),
        ],
      ),
    );
  }
}
