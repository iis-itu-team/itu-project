import 'package:food_blueprint/src/models/ingredient.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

enum BurgerRating { up, down, none }

// Burger fetched from the API
class Burger {
  String? id;
  String? name;
  bool publish = false;
  List<Ingredient> ingredients = [];
  String? keeperId;
  int? price;
  Image? image;
  int? rating;
  BurgerRating? currentRating;

  Burger();

  Burger.fromBurger(Burger burger)
      : id = burger.id,
        name = burger.name,
        publish = burger.publish,
        ingredients = List.from(burger.ingredients),
        keeperId = burger.keeperId,
        image = burger.image,
        price = burger.price,
        rating = burger.rating,
        currentRating = burger.currentRating;

  Burger.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        publish = json['publish'] as bool,
        keeperId = json['keeperId'] as String,
        price = json['price'] as int,
        rating = json['rating'] as int {
    ingredients = [];
    for (var ingredient in json['ingredients']) {
      ingredients.add(jsonDecode(ingredient) as Ingredient);
    }
    switch (json['currentRating'] as String) {
      case 'up':
        currentRating = BurgerRating.up;
        break;
      case 'down':
        currentRating = BurgerRating.down;
        break;
      default:
        currentRating = BurgerRating.none;
        break;
    }
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'publish': publish.toString(),
        'ingredients': ingredients.map((e) => e.toJson()).toList(),
        'keeperId': keeperId,
      };
}
