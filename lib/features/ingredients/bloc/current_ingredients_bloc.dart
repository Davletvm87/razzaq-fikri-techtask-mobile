import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../ingredients.dart';

part 'current_ingredients_event.dart';
part 'current_ingredients_state.dart';

class CurrentIngredientsBloc
    extends Bloc<CurrentIngredientsEvent, CurrentIngredientsState> {
  CurrentIngredientsBloc() : super(CurrentIngredientsInitial());

  @override
  Stream<CurrentIngredientsState> mapEventToState(
      CurrentIngredientsEvent event) async* {
    if (event is AddRemoveIngredientEvent) {
      yield* _addRemoveIngredient(event);
    } else if (event is ClearIngredientsEvent) {
      yield CurrentIngredientsIdle(List());
    }
  }

  Stream<CurrentIngredientsState> _addRemoveIngredient(
      AddRemoveIngredientEvent event) async* {
    List<Ingredient> ingredientStash = List()..addAll(state.ingredients);

    if (!ingredientStash.contains(event.ingredient)) {
      ingredientStash.add(Ingredient(
        title: event.ingredient.title,
        useBy: event.ingredient.useBy,
      ));
    } else {
      ingredientStash.remove(event.ingredient);
    }

    yield CurrentIngredientsIdle(ingredientStash);
  }
}
