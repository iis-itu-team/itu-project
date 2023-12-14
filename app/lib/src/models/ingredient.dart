import 'package:food_blueprint/src/models/ingredient_in_food.dart';

class Ingredient {
  final String id;
  final String name;
  final int price;
  final String category;

  Ingredient(this.id, this.name, this.price, this.category);

  Ingredient.fromInFood(IngredientInFood inFood)
      : id = inFood.id,
        name = inFood.name,
        price = inFood.price,
        category = inFood.category;

  Ingredient.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        price = json["price"],
        name = json["name"],
        category = json["category"];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'price': price, 'category': category};
}
