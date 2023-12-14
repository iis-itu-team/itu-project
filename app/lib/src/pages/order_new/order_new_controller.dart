import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/order.dart';
import 'package:food_blueprint/src/services/order_service.dart';

class OrderNewController {
  final OrderService orderService;

  OrderNewController(this.orderService);

  Future<void> handleSave(
      String houseNumber,
      String zipCode,
      String city,
      String floor,
      String notes,
      bool ring,
      bool toHouse,
      bool toDoors,
      bool toFlatDoors) async {
    Order? order = Order();

    order.houseNumber = houseNumber;
    order.zipCode = zipCode;
    order.city = city;
    order.floor = floor;
    order.notes = notes;
    order.ring = ring;
    order.toHouse = toHouse;
    order.toDoors = toDoors;
    order.toFlatDoors = toFlatDoors;

    HttpResult<void> result;

    result = await orderService.createOrder(order);

    if (result.status == "success") {}
  }
}
