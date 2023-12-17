/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Collaborator: Martin Otradovec
///  Collaborator e-mail: xotrad00@fit.vutbr.cz
///  Date: 06. 12. 2023
///
import 'package:food_blueprint/src/models/ingredient.dart';

class IngredientInFood {
  final String id;

  final String name;
  final String category;

  int amount;
  int index;

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
