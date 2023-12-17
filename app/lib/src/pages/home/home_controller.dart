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
import 'package:food_blueprint/src/utils/keeper_store.dart';

class HomeController {
  final BurgerService burgerService;

  // cache burgers to reduce API calls
  List<Burger>? cachedBurgers;

  HomeController(this.burgerService) {
    // -- listen to Burger CUD events, revalidate cached burgers

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

  // List all burgers.
  Future<List<Burger>> listBurgers() async {
    final result =
        await burgerService.listBurgers(null).catchError((error, stack) {
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

  // List burgers owned by this keeper.
  Future<List<Burger>> listMyBurgers() async {
    return listBurgers().then((burgers) async {
      String? keeperId = await KeeperStore.getKeeperId();

      if (keeperId == null) {
        return [];
      }

      burgers =
          burgers.where((element) => element.keeperId == keeperId).toList();

      burgers.sort((a, b) => a.createdAt != null &&
              b.createdAt != null &&
              a.createdAt!.isBefore(b.createdAt!)
          ? 1
          : -1);

      return burgers;
    });
  }

  Future<List<Burger>> listCommunityBurgers() async {
    return listBurgers().then((burgers) async {
      String? keeperId = await KeeperStore.getKeeperId();

      if (keeperId == null) {
        return [];
      }

      burgers = burgers
          .where((element) =>
              element.published == true && keeperId != element.keeperId)
          .toList();

      burgers.sort((a, b) =>
          a.rating != null && b.rating != null && a.rating! > b.rating!
              ? -1
              : 1);
      return burgers;
    });
  }

  void clearCache() {
    cachedBurgers = null;
  }

  bool isCached() {
    return cachedBurgers != null;
  }
}
