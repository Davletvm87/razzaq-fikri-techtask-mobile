import 'package:flutter/material.dart';

class AppRouter {
  static const routeSelectDate = "/";
  static const routeIngredients = "/ingredients";
  static const routeRecipes = "/recipes";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeSelectDate:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
        break;
      default:
        return null;
    }
  }
}
