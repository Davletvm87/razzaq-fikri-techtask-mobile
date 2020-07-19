part of 'current_ingredients_bloc.dart';

@immutable
abstract class CurrentIngredientsState implements Equatable {
  final List<Ingredient> ingredients;

  CurrentIngredientsState(this.ingredients);
}

@immutable
class CurrentIngredientsInitial extends CurrentIngredientsState {
  CurrentIngredientsInitial() : super(List());

  @override
  List<Object> get props => [toString()];

  @override
  bool get stringify => true;

  @override
  String toString() => 'Initial Current Ingredients';
}

@immutable
class CurrentIngredientsIdle extends CurrentIngredientsState {
  CurrentIngredientsIdle(List<Ingredient> ingredients) : super(ingredients);

  @override
  List<Object> get props => [ingredients];

  @override
  bool get stringify => true;

  @override
  String toString() =>
      'Number of Ingredients: ' + ingredients.length.toString();
}
