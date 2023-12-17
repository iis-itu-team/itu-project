///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 05. 11. 2023
///
import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/services/burger_service.dart';

class HomeController {
  final BurgerService foodService;

  List<Burger>? cachedBurgers;

  HomeController(this.foodService);

  Future<List<Burger>> listBurgers() async {
    final result =
        await foodService.listBurgers(null).catchError((error, stack) {
      developer.log(stack.toString());
      return HttpResult(600, "fail", List<Burger>.from([]));
    });

    if (result.status != "success") {
      throw "Couldn't fetch burgers.";
    }

    if (cachedBurgers != null) {
      return cachedBurgers!;
    }

    cachedBurgers = List.from(result.data!);
    return result.data!;
  }
}
