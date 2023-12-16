import 'package:food_blueprint/src/models/burger.dart';

abstract class IRatingChanged {
  void onRatingChanged(
      String burgerId, BurgerRating currentDirection, int totalRating);
}
