import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/ingredients/ingredients.dart';
import '../../shared/shared.dart';

class MolFabShowRecipe extends StatefulWidget {
  @override
  _MolFabShowRecipeState createState() => _MolFabShowRecipeState();
}

class _MolFabShowRecipeState extends State<MolFabShowRecipe> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentIngredientsBloc, CurrentIngredientsState>(
        builder: (context, state) {
      return state.ingredients.isEmpty
          ? Container()
          : FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.routeRecipes);
              },
              label: Row(
                children: [
                  Text('Show Recipes'),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
            );
    });
  }
}
