import 'package:food_blueprint/src/models/ingredient.dart';

class IngredientInFood {
  final String id;

  final String name;
  final String category;

  final int amount;
  final int index;

  final int price;

  final String? icon;

  IngredientInFood(this.id, this.name, this.category, this.amount, this.index,
      this.price, this.icon);

  IngredientInFood.fromIngredient(Ingredient ingredient, this.index)
      : id = ingredient.id,
        name = ingredient.name,
        category = ingredient.category,
        amount = 1,
        price = ingredient.price,
        icon = ingredient.icon;

  IngredientInFood.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        category = json["category"],
        amount = json["amount"],
        index = json["index"],
        price = json["price"],
        icon = json["icon"];

  // serialize for Input on backend
  Map<String, dynamic> toJson() => {'id': id, 'amount': amount, 'index': index};
}
