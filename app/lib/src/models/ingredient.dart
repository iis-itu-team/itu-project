///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 05. 11. 2023
///
import 'package:food_blueprint/src/models/ingredient_in_food.dart';

class Ingredient {
  final String id;
  final String name;
  final int price;
  final String category;
  final String? icon;

  Ingredient(this.id, this.name, this.price, this.category, this.icon);

  Ingredient.fromInFood(IngredientInFood inFood)
      : id = inFood.id,
        name = inFood.name,
        price = inFood.price,
        category = inFood.category,
        icon = inFood.icon;

  Ingredient.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        price = json["price"],
        name = json["name"],
        category = json["category"],
        icon = json["icon"];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'price': price, 'category': category};
}
