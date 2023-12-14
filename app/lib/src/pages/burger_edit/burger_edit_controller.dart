import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/models/ingredient.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/services/burger_service.dart';
import 'package:food_blueprint/src/services/ingredient_service.dart';

class BurgerEditController {
  final BurgerService foodService;
  final IngredientService ingredientService;

  Burger? editedBurger;

  BurgerEditController(this.foodService, this.ingredientService);

  void enter(BurgerEditArguments? args) {
    // we're creating a new food
    if (args == null) {
      editedBurger = Burger();
    } else {
      editedBurger = Burger.fromBurger(args.burger);
    }
  }

  void handleNameUpdate(String value) {
    editedBurger!.name = value;
  }

  Future<void> handleSave() async {
    // todo: make this work

    HttpResult<void> result;
    if (editedBurger!.id != null) {
      result = await foodService.updateBurger(editedBurger!.id!, editedBurger!);
    } else {
      // append random ingredients to allow us to save
      /*final List<Ingredient> ingredients =
          (await ingredientService.listIngredients()).data!;
      editedBurger!.ingredients = [ingredients.first];

      developer.log(editedBurger!.toJson().toString());

      result = await foodService.createBurger(editedBurger!);*/
    }

    // if (result.status == "success") {}
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
