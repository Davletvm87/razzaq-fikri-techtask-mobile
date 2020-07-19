import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/ingredients/ingredients.dart';
import '../../shared/shared.dart';
import '../widgets.dart';

class OrgIngredients extends StatefulWidget {
  final DateTime selectedDate;

  const OrgIngredients({Key key, this.selectedDate}) : super(key: key);

  @override
  _OrgIngredientsState createState() => _OrgIngredientsState();
}

class _OrgIngredientsState extends State<OrgIngredients> {
  IngredientsBloc _ingredientsBloc;
  CurrentIngredientsBloc _currentIngredientsBloc;

  @override
  void initState() {
    super.initState();

    _ingredientsBloc = BlocProvider.of<IngredientsBloc>(context);
    _currentIngredientsBloc = BlocProvider.of<CurrentIngredientsBloc>(context);

    _ingredientsBloc.add(IngredientsEvent.request);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentIngredientsBloc, CurrentIngredientsState>(
      builder: (context, stateCurrentIng) {
        return BlocBuilder<IngredientsBloc, IngredientsState>(
          builder: (context, stateIng) {
            if (stateIng is IngredientsLoaded) {
              return ListView.builder(
                itemCount: stateIng.ingredients.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    enabled: stateIng.ingredients[index].useBy
                                .difference(widget.selectedDate)
                                .inDays <
                            0
                        ? false
                        : true,
                    title: Text(stateIng.ingredients[index].title),
                    subtitle: Text(FormatDate.getStringFormattedDateTime(
                        stateIng.ingredients[index].useBy)),
                    onTap: () {
                      _currentIngredientsBloc.add(AddRemoveIngredientEvent(
                          stateIng.ingredients[index]));
                    },
                    trailing: stateCurrentIng.ingredients
                            .contains(stateIng.ingredients[index])
                        ? Icon(Icons.check_circle)
                        : SizedBox(width: 0),
                  );
                },
              );
            }

            if (stateIng is IngredientsError) {
              return Center(
                child: AtmButtonFlatIcon(
                  icon: Icons.refresh,
                  onPressed: () {
                    _ingredientsBloc.add(IngredientsEvent.request);
                  },
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
