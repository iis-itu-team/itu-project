///
///  Author: Matúš Hubinský
///  Author e-mail: xhubin04@fit.vutbr.cz
///  Date: 05. 12. 2023
///
import 'package:food_blueprint/src/models/burger.dart';

class _PrivateBurger {
  String? name;
  int? price;
  int? amount;
  String? icon;

  _PrivateBurger.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    amount = json['amount'];
    icon = json["icon"];
  }
}

class Order {
  String? id;
  String? city;
  String? street;
  String? houseNumber;
  String? flatNumber;
  String? postalCode;
  String? deliveryType;
  String? floor;
  String? note;
  int? price;
  bool? ring;
  String? paymentType;
  String? date;
  String? keeperId;

  List<Burger> burgers = [];

  List<_PrivateBurger> privateBurgers = [];

  Order({
    this.city = '',
    this.street = '',
    this.houseNumber = '',
    this.postalCode = '',
    this.flatNumber = '',
    this.floor = '',
    this.note = '',
    this.ring = false,
    this.deliveryType = '',
    this.paymentType = '',
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    date = json["created_at"];
    street = json["street"];
    price = json["price"];
    burgers = [];

    for (var burgerJson in json['burgers'] ?? []) {
      privateBurgers.add(_PrivateBurger.fromJson(burgerJson));
    }
  }

  Map<String, dynamic> toJson(amount) => {
        'burgers': burgers.map((e) => e.toOrderJson(amount)).toList(),
        "city": city,
        'street': street,
        'houseNumber': houseNumber,
        'postalCode': postalCode,
        'flatNumber': flatNumber,
        'floor': floor,
        'note': note,
        'deliveryType': deliveryType,
        'ring': ring,
        'paymentType': paymentType,
        'keeperId': keeperId,
      };
}
