import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

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
    _textEditingController.text = _selectedDate.toIso8601String();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lunch Recipe Suggestion',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(),
    );
  }
}
