/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 12. 12. 2023
///
import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/services/order_service.dart';

import 'package:food_blueprint/src/utils/keeper_store.dart';

class OrderNewController {
  final OrderService orderService;

  OrderNewController(this.orderService);

  Future<void> handleSave(order) async {
    HttpResult<void> result;

    order.keeperId = await KeeperStore.getKeeperId();

    result = await orderService.createOrder(order);

    if (result.status == "success") {}
  }
}
