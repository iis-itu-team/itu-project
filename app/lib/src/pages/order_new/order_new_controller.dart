import 'package:food_blueprint/src/http/result.dart';
import 'package:food_blueprint/src/models/order.dart';
import 'package:food_blueprint/src/services/order_service.dart';

class OrderNewController {
  final OrderService orderService;

  OrderNewController(this.orderService);

  Future<void> handleSave(
      String houseNumber,
      String street,
      String zipCode,
      String city,
      String floor,
      int flatNumber,
      String notes,
      bool ring,
      bool toHouse,
      bool toDoors,
      bool toFlatDoors) async {
    Order? order = Order();

    order.city = city;
    order.street = street;
    order.houseNumber = houseNumber;
    order.flatNumber = flatNumber;
    order.postalCode = zipCode;
    order.deliveryType = "house";
    order.floor = floor;
    order.note = notes;
    order.ring = ring;
    order.paymentType = "card";

    HttpResult<void> result;

    result = await orderService.createOrder(order);

    if (result.status == "success") {}
  }
}
