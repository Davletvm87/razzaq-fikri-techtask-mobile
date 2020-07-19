import 'package:dio/dio.dart';

import '../recipe.dart';
import '../../ingredients/ingredients.dart';
import '../../../shared/shared.dart';

class RecipesService extends Service<List<Ingredient>, List<Recipe>> {
  final ApiClient apiClient;
  final String baseUrl;

  RecipesService({this.apiClient, this.baseUrl});

  @override
  Future<List<Recipe>> post(List<Ingredient> input) async {
    Response response = await apiClient.getRequest(
      recipe,
      queryParams: {"ingredients": formatIngredients(input)},
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return recipeFromJson(response.data);
    }

    throw Exception(
        "Failed to fetch recipes data. (code: ${response.statusCode}");
  }

  String formatIngredients(List<Ingredient> input) {
    String ingredients = "";

    for (int i = 0; i < input.length; i++) {
      if (i < input.length - 1) {
        ingredients += "${input[i].title},";
      } else {
        ingredients += "${input[i].title}";
      }
    }
    return ingredients;
  }
}
