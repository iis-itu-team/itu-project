import 'package:food_blueprint/src/services/order_service.dart';

class OrderShowController {
  // final BurgerService foodService;
  final OrderService orderService;

  const OrderShowController(this.orderService);

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
