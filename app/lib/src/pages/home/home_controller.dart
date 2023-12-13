import 'dart:developer' as developer;
import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/services/burger_service.dart';

class HomeController {
  final BurgerService foodService;

  const HomeController(this.foodService);

  Future<List<Burger>> listBurgers() async {
    final result = await foodService.listBurgers();

    if (result.status != "success") {
      // todo: error? popup?
      developer.log('home');
      return [];
    }

    return result.data!;
  }
}
