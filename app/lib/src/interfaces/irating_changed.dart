/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Marek Vandík
///  Author e-mail: xvandi01@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'package:food_blueprint/src/models/burger.dart';

abstract class IRatingChanged {
  void onRatingChanged(
      String burgerId, BurgerRating currentDirection, int totalRating);
}
