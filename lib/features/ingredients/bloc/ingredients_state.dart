part of 'ingredients_bloc.dart';

@immutable
abstract class IngredientsState extends Equatable {}

@immutable
class IngredientsInitial extends IngredientsState {
  @override
  List<Object> get props => [toString()];

  @override
  String toString() => 'Initial';
}

@immutable
class IngredientsLoading extends IngredientsState {
  @override
  List<Object> get props => [toString()];

  @override
  String toString() => 'Loading';
}

@immutable
class IngredientsLoaded extends IngredientsState {
  final List<Ingredient> ingredients;

  IngredientsLoaded(this.ingredients);

  @override
  List<Object> get props => [ingredients];

  @override
  String toString() => 'Loaded: ' + ingredients.length.toString();
}

@immutable
class IngredientsError extends IngredientsState {
  final String message;

  IngredientsError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Error: ' + message;
}
