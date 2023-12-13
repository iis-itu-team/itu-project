import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/models/ingredient.dart';
import 'package:food_blueprint/src/pages/burger_edit/burger_edit_arguments.dart';
import 'package:food_blueprint/src/services/burger_service.dart';

class BurgerEditController {
  final BurgerService foodService;

  Burger? editedBurger;

  BurgerEditController(this.foodService);

  void enter(BurgerEditArguments? args) {
    // we're creating a new food
    if (args == null) {
      editedBurger = Burger();
    } else {
      editedBurger = Burger.fromBurger(args.food);
    }
  }

  void handleNameUpdate(String value) {
    editedBurger!.name = value;
  }

  Future<void> handleSave() async {
    HttpResult<void> result;
    if (editedBurger!.id != null) {
      result = await foodService.updateBurger(editedBurger!.id!, editedBurger!);
    } else {
      // append random ingredients to allow us to save
      final List<Ingredient> ingredients =
          (await foodService.listIngredients()).data!;
      editedBurger!.ingredients = [ingredients.first];

      developer.log(editedBurger!.toJson().toString());

      result = await foodService.createBurger(editedBurger!);
    }

    if (result.status == "success") {}
  }
}
