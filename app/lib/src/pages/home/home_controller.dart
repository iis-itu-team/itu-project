///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 05. 11. 2023
///
import 'dart:developer' as developer;

import 'package:food_blueprint/src/events/burger_created_event.dart';
import 'package:food_blueprint/src/events/burger_deleted_event.dart';
import 'package:food_blueprint/src/events/burger_updated_event.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/services/burger_service.dart';
import 'package:food_blueprint/src/utils/event_handler.dart';

class HomeController {
  final BurgerService foodService;

  List<Burger>? cachedBurgers;

  HomeController(this.foodService) {
    EventHandler.listen<BurgerDeletedEvent>((event) {
      cachedBurgers?.removeWhere((element) => element.id == event.burger.id);
    });

    EventHandler.listen<BurgerCreatedEvent>((event) {
      cachedBurgers?.add(event.burger);
    });

    EventHandler.listen<BurgerUpdatedEvent>((event) {
      if (cachedBurgers == null) {
        return;
      }

      int idx = cachedBurgers
              ?.indexWhere((element) => element.id == event.burger.id) ??
          -1;

      if (idx != -1) {
        cachedBurgers![idx] = event.burger;
      }
    });
  }

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

  void clearCache() {
    cachedBurgers = null;
  }

  bool isCached() {
    return cachedBurgers != null;
  }
}
