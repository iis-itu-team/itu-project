import 'package:food_blueprint/src/models/ingredient.dart';

class IngredientInFood {
  final String id;

  final String name;
  final String category;

  final int amount;
  final int index;

  final int price;

  IngredientInFood(
      this.id, this.name, this.category, this.amount, this.index, this.price);

  IngredientInFood.fromIngredient(Ingredient ingredient, this.index)
      : id = ingredient.id,
        name = ingredient.name,
        category = ingredient.category,
        amount = 1,
        price = ingredient.price;

  IngredientInFood.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        category = json["category"],
        amount = json["amount"],
        index = json["index"],
        price = json["price"];

  // serialize for Input on backend
  Map<String, dynamic> toJson() => {'id': id, 'amount': amount, 'index': index};
}
