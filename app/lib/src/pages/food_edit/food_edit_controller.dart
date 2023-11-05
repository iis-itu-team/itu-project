import 'dart:developer' as developer;

import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/food.dart';
import 'package:food_blueprint/src/models/ingredient.dart';
import 'package:food_blueprint/src/pages/food_edit/food_edit_arguments.dart';
import 'package:food_blueprint/src/services/food_service/food_service.dart';

class FoodEditController {
  final FoodService foodService;

  EditedFood? editedFood;

  FoodEditController(this.foodService);

  void enter(FoodEditArguments? args) {
    // we're creating a new food
    if (args == null) {
      editedFood = EditedFood();
    } else {
      editedFood = EditedFood.fromFood(args.food);
    }
  }

  void handleNameUpdate(String value) {
    editedFood!.name = value;
  }

  Future<void> handleSave() async {
    HttpResult<void> result;
    if (editedFood!.id != null) {
      result = await foodService.updateFood(editedFood!.id!, editedFood!);
    } else {
      // append random ingredients to allow us to save
      final List<Ingredient> ingredients =
          (await foodService.listIngredients()).data!;
      editedFood!.ingredients = [ingredients.first];

      developer.log(editedFood!.toJson().toString());

      result = await foodService.createFood(editedFood!);
    }

    if (result.status == "success") {}
  }
}
