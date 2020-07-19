import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../recipe.dart';
import '../../ingredients/ingredients.dart';
import '../../../shared/shared.dart';

part 'recipes_state.dart';

enum RecipesEvent { request }

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final CurrentIngredientsBloc currentIngredientsBloc;
  final Service<List<Ingredient>, List<Recipe>> recipeService;

  RecipesBloc(
      {@required this.currentIngredientsBloc, @required this.recipeService})
      : super(RecipesInitial());

  @override
  Stream<RecipesState> mapEventToState(
    RecipesEvent event,
  ) async* {
    if (state is IngredientsLoading) return;

    List<Ingredient> ingredients = currentIngredientsBloc.state.ingredients;

    yield RecipesLoading();

    try {
      yield await _loadIngredients(ingredients);
    } catch (e) {
      yield RecipesError(e.toString());
    }
  }

  Future<RecipesState> _loadIngredients(List<Ingredient> input) async {
    List<Recipe> newState = await recipeService.post(input);
    return RecipesLoaded(newState);
  }
}
