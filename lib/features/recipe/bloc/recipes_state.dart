part of 'recipes_bloc.dart';

@immutable
abstract class RecipesState extends Equatable {}

@immutable
class RecipesInitial extends RecipesState {
  @override
  List<Object> get props => [toString()];

  @override
  String toString() => 'Initial';
}

@immutable
class RecipesLoading extends RecipesState {
  @override
  List<Object> get props => [toString()];

  @override
  String toString() => 'Loading';
}

@immutable
class RecipesLoaded extends RecipesState {
  final List<Recipe> recipes;

  RecipesLoaded(this.recipes);

  @override
  List<Object> get props => [recipes];

  @override
  String toString() => 'Loaded: ' + recipes.length.toString();
}

@immutable
class RecipesError extends RecipesState {
  final String message;

  RecipesError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Error: ' + message;
}
