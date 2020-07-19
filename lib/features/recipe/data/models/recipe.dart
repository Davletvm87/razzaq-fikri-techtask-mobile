import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

List<Recipe> recipeFromJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@immutable
class Recipe extends Equatable {
  Recipe({
    this.title,
    this.ingredients,
  });

  final String title;
  final List<String> ingredients;

  @override
  List<Object> get props => [title, ingredients];

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        title: json["title"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
      };
}
