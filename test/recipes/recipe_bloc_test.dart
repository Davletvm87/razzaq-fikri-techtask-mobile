import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/features/ingredients/ingredients.dart';
import 'package:tech_task/features/recipe/recipe.dart';

class MockRecipesService extends Mock implements RecipesService {}

void main() {
  group('Get Recipe Bloc', () {
    MockRecipesService mockRecipesService;
    CurrentIngredientsBloc currentIngredientsBloc;

    setUp(() {
      mockRecipesService = MockRecipesService();
      currentIngredientsBloc = CurrentIngredientsBloc();

      currentIngredientsBloc.add(AddRemoveIngredientEvent(
          Ingredient(title: 'Bread', useBy: DateTime.parse('2020-11-01'))));
    });

    tearDown(() {
      currentIngredientsBloc.close();
    });

    List<Recipe> recipes = [
      Recipe(
        title: 'Salad',
        ingredients: [
          "Lettuce",
          "Tomato",
          "Cucumber",
          "Beetroot",
          "Salad Dressing"
        ],
      ),
      Recipe(
        title: 'Hotdog',
        ingredients: ["Hotdog Bun", "Sausage", "Ketchup", "Mustard"],
      ),
    ];

    blocTest(
      'Emits: [Loading, Loaded] when success',
      build: () async {
        when(mockRecipesService.post(any)).thenAnswer((_) async => recipes);
        return RecipesBloc(
            recipeService: mockRecipesService,
            currentIngredientsBloc: currentIngredientsBloc);
      },
      act: (bloc) => bloc.add(RecipesEvent.request),
      expect: [
        RecipesLoading(),
        RecipesLoaded(recipes),
      ],
    );

    blocTest(
      'Emits: [Loading, Error] when success',
      build: () async {
        when(mockRecipesService.post(any))
            .thenThrow(Exception("Failed to fetch recipes data. (code: 500)"));
        return RecipesBloc(
            recipeService: mockRecipesService,
            currentIngredientsBloc: currentIngredientsBloc);
      },
      act: (bloc) => bloc.add(RecipesEvent.request),
      expect: [
        RecipesLoading(),
        RecipesError(
            Exception("Failed to fetch recipes data. (code: 500)").toString()),
      ],
    );
  });
}
