import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/models/user.dart';

class SavedBurger {
  final User user;
  final Burger burger;

  SavedBurger(this.user, this.burger);

  SavedBurger.fromJson(Map<String, dynamic> json)
      : user = json["user"],
        burger = json["burger"];

  Map<String, dynamic> toJson() => {'user': user, 'burger': burger};
}
