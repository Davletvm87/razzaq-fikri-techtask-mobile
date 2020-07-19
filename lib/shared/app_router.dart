import 'package:flutter/material.dart';

import '../features/ingredients/ingredients.dart';
import '../features/recipe/recipe.dart';

class AppRouter {
  static const routeSelectDate = "/";
  static const routeIngredients = "/ingredients";
  static const routeRecipes = "/recipes";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeSelectDate:
        return MaterialPageRoute(
          builder: (context) => PageSelectDate(),
        );
        break;
      case routeIngredients:
        return MaterialPageRoute(
          builder: (context) => PageIngredients(),
        );
        break;
      case routeRecipes:
        return MaterialPageRoute(
          builder: (context) => PageRecipes(),
        );
        break;
      default:
        return null;
    }
  }
}
