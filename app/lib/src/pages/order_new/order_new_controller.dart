import 'package:food_blueprint/src/services/order_service.dart';

class OrderNewController {
  // final BurgerService foodService;
  final OrderService orderService;

  OrderNewController(this.orderService);

  String? city = "";

  void handleTextUpdate(String value) {
    city = value;
  }
}
