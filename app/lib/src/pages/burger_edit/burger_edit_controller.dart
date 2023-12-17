///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 07. 12. 2023
///
import 'dart:developer' as developer;

import 'package:food_blueprint/src/events/burger_created_event.dart';
import 'package:food_blueprint/src/events/burger_deleted_event.dart';
import 'package:food_blueprint/src/events/burger_updated_event.dart';
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/models/ingredient.dart';
import 'package:food_blueprint/src/models/ingredient_in_food.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/services/burger_service.dart';
import 'package:food_blueprint/src/services/ingredient_service.dart';
import 'package:food_blueprint/src/utils/event_handler.dart';

class BurgerEditController {
  final BurgerService burgerService;
  final IngredientService ingredientService;

  Burger? editedBurger;

  BurgerEditController(this.burgerService, this.ingredientService);

  void enter(BurgerEditArguments? args, List<Ingredient> availableIngredients) {
    if (args?.burger != null) {
      editedBurger = Burger.fromBurger(args!.burger);
    } else {
      editedBurger = Burger();

      Ingredient bun = availableIngredients
          .firstWhere((element) => element.category == "bun");

      editedBurger?.name = "Default Burgr";

      // top and bottom bun by default
      editedBurger?.ingredients.addAll([
        IngredientInFood.fromIngredient(bun, 0),
        IngredientInFood.fromIngredient(bun, 1)
      ]);
    }
  }

  Future<void> handleDelete() async {
    if (editedBurger?.id == null) {
      return;
    }

    HttpResult<void> result =
        await burgerService.deleteBurger(editedBurger!.id!);

    if (result.status != "success") {
      throw "Couldn't delete burger. code: ${result.status}";
    }

    EventHandler.fire(BurgerDeletedEvent(editedBurger!));
  }

  Future<void> handleSave() async {
    developer.log(editedBurger!.name.toString());

    // update indexes on ingredients according to their position in the list
    for (int index = 0; index < editedBurger!.ingredients.length; index++) {
      editedBurger!.ingredients[index].index = index;
    }

    HttpResult<Burger> result;
    bool newBurger = editedBurger!.id == null;
    if (newBurger) {
      result = await burgerService.createBurger(editedBurger!);
    } else {
      result =
          await burgerService.updateBurger(editedBurger!.id!, editedBurger!);
    }

    if (result.status == "success") {
      Burger burger = result.data!;
      EventHandler.fire(
          newBurger ? BurgerCreatedEvent(burger) : BurgerUpdatedEvent(burger));
    } else {
      throw "Couldn't save burger.";
    }
  }

  Future<List<Ingredient>> listIngredients() async {
    final result = await ingredientService.listIngredients();

    if (result.status != "success") {
      // todo: error? popup?
      return [];
    }

    return result.data!;
  }

  Future<List<String>> listCategories() async {
    final result = await ingredientService.listCategories().catchError((error) {
      developer.log(error.toString());
      throw error;
    });

    if (result.status != "success") {
      // todo: error? popup?
      return [];
    }

    return result.data!;
  }
}
