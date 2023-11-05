import 'dart:convert';

import 'package:food_blueprint/src/models/ingredient.dart';

class Food {
  final String id;
  String name;

  Food(this.id, this.name);

  Food.fromJson(Map<String, dynamic> json)
      : id = json["id"] as String,
        name = json['name'] as String;

  Map<String, dynamic> toJson() => {'name': name};
}

class EditedFood {
  String? id;
  String? name;
  bool publish = false;
  List<Ingredient> ingredients = [];
  String? keeperId;

  EditedFood();

  EditedFood.fromFood(Food food)
      : id = food.id,
        name = food.name;

  Map<String, dynamic> toJson() => {
        'name': name,
        'publish': publish.toString(),
        'ingredients': ingredients.map((e) => e.toJson()).toList(),
        'keeperId': "keeper_01HEBWQH773TXCBZCK1HQDX79G"
      };
}
