import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/models/ingredient.dart';

class IngredientInFood {
  final Burger burger;
  final Ingredient ingredient;

  final int amount;
  final int order;

  IngredientInFood(this.burger, this.ingredient, this.amount, this.order);

  IngredientInFood.fromJson(Map<String, dynamic> json)
      : burger = json["burger"],
        ingredient = json["ingredient"],
        amount = json["amount"],
        order = json["order"];

  Map<String, dynamic> toJson() => {
        'burger': burger,
        'ingredient': ingredient,
        'amount': amount,
        'order': order
      };
}
