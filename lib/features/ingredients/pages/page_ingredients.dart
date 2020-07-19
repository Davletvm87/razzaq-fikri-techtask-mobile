import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_task/features/ingredients/ingredients.dart';

import '../../../widgets/widgets.dart';

class PageIngredients extends StatefulWidget {
  final DateTime selectedDate;

  const PageIngredients({Key key, this.selectedDate}) : super(key: key);

  @override
  _PageIngredientsState createState() => _PageIngredientsState();
}

class _PageIngredientsState extends State<PageIngredients> {
  CurrentIngredientsBloc currentIngredientsBloc;
  @override
  void initState() {
    super.initState();
    currentIngredientsBloc = BlocProvider.of<CurrentIngredientsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return TmpIngredients(
      selectedDate: widget.selectedDate,
      onBackPressed: () async {
        currentIngredientsBloc.add(ClearIngredientsEvent());
        Navigator.pop(context);
        return true;
      },
    );
  }
}
