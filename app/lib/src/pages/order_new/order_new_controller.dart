import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/services/burger_service/burger_service.dart';
import 'package:food_blueprint/src/services/order_service/order_service.dart';

class OrderController {
  // final BurgerService foodService;
  final OrderService orderService;

  const OrderController(this.orderService);

  // TODO: save order
  // TODO: show orders

  /*
  Future<List<Burger>> listBurgers() async {
    final result = await foodService.listBurgers();

    if (result.status != "success") {
      // todo: error? popup?
      return [];
    }

    return result.data!;
  }
  */
}
