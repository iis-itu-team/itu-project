import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/services/order_service.dart';

import 'dart:developer' as developer;

import 'package:food_blueprint/src/utils/keeper_store.dart';

class OrderNewController {
  final OrderService orderService;

  OrderNewController(this.orderService);

  Future<void> handleSave(order) async {
    HttpResult<void> result;

    developer.log("controller");
    developer.log(order.city.toString());

    order.keeperId = await KeeperStore.getKeeperId();

    result = await orderService.createOrder(order);

    if (result.status == "success") {}
  }
}
