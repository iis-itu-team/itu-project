import 'package:food_blueprint/src/models/burger.dart';

class SavedBurger {
  final Burger burger;

  SavedBurger(this.burger);

  SavedBurger.fromJson(Map<String, dynamic> json)
      : burger = json["burger"];

  Map<String, dynamic> toJson() => {'burger': burger};
}
