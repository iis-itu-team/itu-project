/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 12. 12. 2023
///
import 'package:food_blueprint/src/models/order.dart';
import 'package:food_blueprint/src/services/order_service.dart';

import 'dart:developer' as developer;

class OrderShowController {
  // final BurgerService foodService;
  final OrderService orderService;

  const OrderShowController(this.orderService);

  Future<List<Order>> listOrders() async {
    final result = await orderService.listOrders().catchError((error) {
      developer.log(error.toString());
    });

    if (result.status != "success") {
      return [];
    }

    return result.data!;
  }
}
