import 'dart:developer' as developer;

import 'package:food_blueprint/src/models/ingredient_in_food.dart';

enum BurgerRating { up, down, none }

// Burger fetched from the API
class Burger {
  String? id;
  String? name;
  bool publish = false;
  List<IngredientInFood> ingredients = [];
  String? keeperId;
  int? price;
  String? image;
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

  Burger.fromJson(Map<String, dynamic> json) {
    // todo: uncomment rating when done on backend

    id = json['id'];
    name = json['name'];
    publish = json['published'];
    keeperId = json['keeper_id'];
    price = json['price'];
    image = json['image'];
    // rating = json['rating'] as int;

    ingredients = [];

    for (var ingredientJson in json['ingredients']) {
      ingredients.add(IngredientInFood.fromJson(ingredientJson));
    }

    // sort ingredients
    ingredients.sort((a, b) {
      return a.index > b.index ? -1 : 1;
    });

    /*switch (json['currentRating'] as String) {
      case 'up':
        currentRating = BurgerRating.up;
        break;
      case 'down':
        currentRating = BurgerRating.down;
        break;
      default:
        currentRating = BurgerRating.none;
        break;
    }*/
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'publish': publish.toString(),
        'ingredients': ingredients.map((e) => e.toJson()).toList(),
        'keeperId': keeperId,
      };
}
