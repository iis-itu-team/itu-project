import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/services/burger_service.dart';
import 'package:food_blueprint/src/utils/keeper_store.dart';

import 'dart:developer' as developer;

class MineController {
  final BurgerService burgerService;

  const MineController(this.burgerService);

  Future<List<Burger>> listBurgers() async {
    GetBurgersInput input = GetBurgersInput.from(await KeeperStore.getKeeperId(), null);
    developer.log("controller: ${input.toString()}");
    final result = await burgerService
        .listBurgers(input)
        .catchError((error, stack) {
      return HttpResult(600, "fail", List<Burger>.from([]));
    });

    if (result.status != "success") {
      throw "Failed to list burgers.";
    }

    return result.data!;
  }
}
