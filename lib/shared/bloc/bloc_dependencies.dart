import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_task/features/ingredients/ingredients.dart';
import 'package:tech_task/features/recipe/recipe.dart';

import '../shared.dart';

List<BlocProvider> providers = [
  BlocProvider<CurrentIngredientsBloc>(
    create: (context) => CurrentIngredientsBloc(),
  ),
  BlocProvider<IngredientsBloc>(
    create: (context) => IngredientsBloc(
        ingredientService:
            RepositoryProvider.of<RepositoryBundle>(context).ingredient),
  ),
  BlocProvider<RecipesBloc>(
    create: (context) => RecipesBloc(
      recipeService: RepositoryProvider.of<RepositoryBundle>(context).recipe,
      currentIngredientsBloc: CurrentIngredientsBloc(),
    ),
  ),
];
