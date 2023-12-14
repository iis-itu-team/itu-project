import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/services/burger_service.dart';

import 'dart:developer' as developer;

class HomeController {
  final BurgerService foodService;

  const HomeController(this.foodService);

  Future<List<Burger>> listBurgers() async {
    final result = await foodService.listBurgers().catchError((error, stack) {
      developer.log(stack.toString());
      return HttpResult(600, "fail", List<Burger>.from([]));
    });

    if (result.status != "success") {
      // todo: error? popup?
      return [];
    }

    return result.data!;
  }
}
