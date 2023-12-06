import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/models/user.dart';

class UserRating {
  final User user;
  final Burger burger;
  final int rating;

  UserRating(this.user, this.burger, this.rating);

  UserRating.fromJson(Map<String, dynamic> json)
      : user = json["user"],
        burger = json["burger"],
        rating = json["rating"];

  Map<String, dynamic> toJson() =>
      {'user': user, 'burger': burger, 'rating': rating};
}
