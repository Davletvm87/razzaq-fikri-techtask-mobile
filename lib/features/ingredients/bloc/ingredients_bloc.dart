import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../ingredients.dart';
import '../../../shared/shared.dart';

part 'ingredients_state.dart';

enum IngredientsEvent { request }

class IngredientsBloc extends Bloc<IngredientsEvent, IngredientsState> {
  final Service<dynamic, List<Ingredient>> ingredientService;

  IngredientsBloc({@required this.ingredientService})
      : super(IngredientsInitial());

  @override
  Stream<IngredientsState> mapEventToState(
    IngredientsEvent event,
  ) async* {
    if (state is IngredientsLoading) return;
    yield IngredientsLoading();

    try {
      yield await _loadIngredients();
    } catch (e) {
      yield IngredientsError(e.toString());
    }
  }

  Future<IngredientsState> _loadIngredients() async {
    List<Ingredient> newState = await ingredientService.post(Null);
    return IngredientsLoaded(newState);
  }
}
