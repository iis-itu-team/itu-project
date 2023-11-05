import 'package:food_blueprint/src/models/food.dart';
import 'package:food_blueprint/src/services/food_service/food_service.dart';

class HomeController {
  final FoodService foodService;

  const HomeController(this.foodService);

  Future<List<Food>> listFoods() async {
    final result = await foodService.listFoods();

    if (result.status != "success") {
      // todo: error? popup?
      return [];
    }

    return result.data!;
  }
}
