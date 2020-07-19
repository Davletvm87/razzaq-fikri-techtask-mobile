import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/recipe/recipe.dart';
import '../widgets.dart';

class OrgRecipes extends StatefulWidget {
  @override
  _OrgRecipesState createState() => _OrgRecipesState();
}

class _OrgRecipesState extends State<OrgRecipes> {
  RecipesBloc _recipesBloc;

  @override
  void initState() {
    super.initState();

    _recipesBloc = BlocProvider.of<RecipesBloc>(context);

    _recipesBloc.add(RecipesEvent.request);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (context, state) {
        if (state is RecipesLoaded) {
          return ListView.separated(
            itemCount: state.recipes.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              return MolRecipeListItemWidget(
                title: state.recipes[index].title,
                ingredients: state.recipes[index].ingredients,
              );
            },
          );
        }

        if (state is RecipesError) {
          return Center(
            child: AtmButtonFlatIcon(
              icon: Icons.refresh,
              onPressed: () {
                _recipesBloc.add(RecipesEvent.request);
              },
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
