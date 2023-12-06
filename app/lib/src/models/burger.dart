import 'dart:convert';

import 'package:food_blueprint/src/models/ingredient.dart';

class burger {
  final String id;
  String name;

  burger(this.id, this.name);

  burger.fromJson(Map<String, dynamic> json)
      : id = json["id"] as String,
        name = json['name'] as String;

  Map<String, dynamic> toJson() => {'name': name};
}

class Editedburger {
  String? id;
  String? name;
  bool publish = false;
  List<Ingredient> ingredients = [];
  String? keeperId;

  Editedburger();

  Editedburger.fromburger(burger burger)
      : id = burger.id,
        name = burger.name;

  Map<String, dynamic> toJson() => {
        'name': name,
        'publish': publish.toString(),
        'ingredients': ingredients.map((e) => e.toJson()).toList(),
        'keeperId': "keeper_01HEBWQH773TXCBZCK1HQDX79G"
      };
}
