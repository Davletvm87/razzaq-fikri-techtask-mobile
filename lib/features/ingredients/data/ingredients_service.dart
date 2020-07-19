import 'dart:convert';

import 'package:dio/dio.dart';

import '../ingredients.dart';
import '../../../shared/shared.dart';

class IngredientsService extends Service<dynamic, List<Ingredient>> {
  final ApiClient apiClient;
  final String baseUrl;

  IngredientsService({this.apiClient, this.baseUrl});

  @override
  Future<List<Ingredient>> post(dynamic input) async {
    Response response = await apiClient.getRequest(ingredients);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return ingredientFromJson(response.data);
    }

    throw Exception(
        "Failed to fetch ingredients data. (code: ${response.statusCode}");
  }
}
