import 'package:food_blueprint/src/models/ingredient_in_food.dart';

enum BurgerRating { up, down, none }

// Burger fetched from the API
class Burger {
  String? id;
  String? name;
  bool published = false;
  List<IngredientInFood> ingredients = [];
  String? keeperId;
  int? price;
  String? image;
  String? icon;
  int? rating;
  BurgerRating? currentRating;

  Burger();

  Burger.fromBurger(Burger burger)
      : id = burger.id,
        name = burger.name,
        published = burger.published,
        ingredients = List.from(burger.ingredients),
        keeperId = burger.keeperId,
        image = burger.image,
        price = burger.price,
        rating = burger.rating,
        currentRating = burger.currentRating,
        icon = burger.icon;

  Burger.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    published = json['published'];
    keeperId = json['keeper_id'];
    price = json['price'];
    image = json['image'];
    icon = json["icon"];
    rating = json['rating'] as int;

    ingredients = [];

    for (var ingredientJson in json['ingredients'] ?? []) {
      ingredients.add(IngredientInFood.fromJson(ingredientJson));
    }

    // sort ingredients
    ingredients.sort((a, b) {
      return a.index > b.index ? 1 : -1;
    });

    switch (json['currentRating'] as int) {
      case 1:
        currentRating = BurgerRating.up;
        break;
      case -1:
        currentRating = BurgerRating.down;
        break;
      default:
        currentRating = BurgerRating.none;
        break;
    }
  }

  Map<String, dynamic> toUpdateInputJson() => {
        'name': name,
        'published': published,
        'ingredients': ingredients.map((i) => i.toJson()).toList()
      };

  Map<String, dynamic> toJson() => {
        'name': name,
        'published': published.toString(),
        'ingredients': ingredients.map((e) => e.toJson()).toList(),
        'keeperId': keeperId,
      };
}
