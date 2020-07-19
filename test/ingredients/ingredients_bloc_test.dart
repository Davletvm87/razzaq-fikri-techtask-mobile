import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:tech_task/features/ingredients/ingredients.dart';

class MockIngredientsService extends Mock implements IngredientsService {}

void main() {
  group('Get Ingredients Bloc', () {
    MockIngredientsService mockIngredientsService;

    setUp(() {
      mockIngredientsService = MockIngredientsService();
    });

    List<Ingredient> ingredients = [
      Ingredient(title: 'Bread', useBy: DateTime.parse('2020-11-01')),
      Ingredient(title: 'Eggs', useBy: DateTime.parse('2020-11-25')),
    ];

    blocTest(
      'Emits: [Loading, Loaded] when success',
      build: () async {
        when(mockIngredientsService.post(any))
            .thenAnswer((_) async => ingredients);
        return IngredientsBloc(ingredientService: mockIngredientsService);
      },
      act: (bloc) => bloc.add(IngredientsEvent.request),
      expect: [
        IngredientsLoading(),
        IngredientsLoaded(ingredients),
      ],
    );

    blocTest(
      'Emits: [Loading, Error] when success',
      build: () async {
        when(mockIngredientsService.post(any)).thenThrow(
            Exception("Failed to fetch ingredients data. (code: 500)"));
        return IngredientsBloc(ingredientService: mockIngredientsService);
      },
      act: (bloc) => bloc.add(IngredientsEvent.request),
      expect: [
        IngredientsLoading(),
        IngredientsError(
            Exception("Failed to fetch ingredients data. (code: 500)")
                .toString()),
      ],
    );
  });
}
