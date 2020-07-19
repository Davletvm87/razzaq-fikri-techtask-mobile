part of 'current_ingredients_bloc.dart';

@immutable
abstract class CurrentIngredientsEvent {}

@immutable
class AddRemoveIngredientEvent extends CurrentIngredientsEvent {
  final Ingredient ingredient;

  AddRemoveIngredientEvent(this.ingredient);

  @override
  String toString() => 'Add/Remove: ' + ingredient.toString();
}

@immutable
class ClearIngredientsEvent extends CurrentIngredientsEvent {
  @override
  String toString() => 'Clear';
}
