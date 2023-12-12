import 'package:food_blueprint/src/models/ingredient.dart';

class Burger {
  final String id;
  String name;

  Burger(this.id, this.name);

  Burger.fromJson(Map<String, dynamic> json)
      : id = json["id"] as String,
        name = json['name'] as String;

  Map<String, dynamic> toJson() => {'name': name};
}

class EditedBurger {
  String? id;
  String? name;
  bool publish = false;
  List<Ingredient> ingredients = [];
  String? keeperId;

  EditedBurger();

  EditedBurger.fromburger(Burger burger)
      : id = burger.id,
        name = burger.name;

  Map<String, dynamic> toJson() => {
        'name': name,
        'publish': publish.toString(),
        'ingredients': ingredients.map((e) => e.toJson()).toList(),
        'keeperId': "keeper_01HEBWQH773TXCBZCK1HQDX79G"
      };
}
