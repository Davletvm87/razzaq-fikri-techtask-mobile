import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../../widgets/widgets.dart';

class PageSelectDate extends StatefulWidget {
  @override
  _PageSelectDateState createState() => _PageSelectDateState();
}

class _PageSelectDateState extends State<PageSelectDate> {
  DateTime _selectedDate;
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();

    _selectedDate = DateTime.now();
    _textEditingController.text =
        FormatDate.getStringFormattedDateTime(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return TmpSelectDate(
      controller: _textEditingController,
      onPressedSelectDate: () async {
        setState(() async {
          _selectedDate = await showDatePicker(
            context: context,
            initialDate: _selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 30)),
          );

          _textEditingController.text =
              FormatDate.getStringFormattedDateTime(_selectedDate);
        });
      },
      onPressedShowIngredients: () {
        Navigator.pushNamed(context, AppRouter.routeIngredients,
            arguments: _selectedDate);
      },
    );
  }
}
