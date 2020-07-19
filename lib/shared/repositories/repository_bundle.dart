import 'package:flutter/material.dart';

import '../shared.dart';
import '../../features/ingredients/ingredients.dart';
import '../../features/recipe/recipe.dart';

@immutable
class RepositoryBundle {
  final Service ingredient;
  final Service recipe;

  RepositoryBundle({@required ApiClient apiClient, @required String baseUrl})
      : ingredient = _buildIngredientRepository(apiClient, baseUrl),
        recipe = _buildRecipeRepository(apiClient, baseUrl);

  static Service _buildIngredientRepository(
      ApiClient apiClient, String baseUrl) {
    return IngredientsService(apiClient: apiClient, baseUrl: baseUrl);
  }

  static Service _buildRecipeRepository(ApiClient apiClient, String baseUrl) {
    return RecipesService(apiClient: apiClient, baseUrl: baseUrl);
  }
}
