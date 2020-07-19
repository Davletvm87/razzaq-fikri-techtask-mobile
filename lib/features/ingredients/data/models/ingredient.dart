import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

List<Ingredient> ingredientFromJson(List<dynamic> resp) {
  String encodedResp = json.encode(resp);
  return List<Ingredient>.from(
      json.decode(encodedResp).map((x) => Ingredient.fromJson(x)));
}

String ingredientToJson(List<Ingredient> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@immutable
class Ingredient extends Equatable {
  Ingredient({
    this.title,
    this.useBy,
  });

  final String title;
  final DateTime useBy;

  @override
  List<Object> get props => [title, useBy];

  @override
  String toString() => '$title - $useBy';

  Ingredient copyWith({
    String title,
    DateTime useBy,
  }) =>
      Ingredient(
        title: title ?? this.title,
        useBy: useBy ?? this.useBy,
      );

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        title: json["title"],
        useBy: DateTime.parse(json["use-by"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "use-by":
            "${useBy.year.toString().padLeft(4, '0')}-${useBy.month.toString().padLeft(2, '0')}-${useBy.day.toString().padLeft(2, '0')}",
      };
}
