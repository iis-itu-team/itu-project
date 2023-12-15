import 'package:food_blueprint/src/models/burger.dart';

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

  Order();

  Order.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        date = json["created_at"],
        street = json["street"],
        price = json["price"];

  Map<String, dynamic> toJson() => {
        'burgers': burgers.map((e) => e.toJson()).toList(),
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
      };
}
