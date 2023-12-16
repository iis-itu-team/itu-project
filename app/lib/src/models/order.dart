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
  int? flatNumber;
  String? postalCode;
  String? deliveryType;
  String? floor;
  String? note;
  int? price;
  bool? ring;
  String? paymentType;
  String? date;

  List<Burger> burgers = [];

  List<_PrivateBurger> privateBurgers = [];

  Order();

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

  Map<String, dynamic> toJson() => {
        "city": city,
        'street': street,
        'postalCode': postalCode,
        'houseNumber': houseNumber,
        'flatNumber': flatNumber,
        'deliveryType': deliveryType,
        'floor': floor,
        'note': note,
        'ring': ring,
        'date': date,
        'paymentType': paymentType,
        'burgers': burgers.map((e) => e.toJson()).toList(),
      };
}
