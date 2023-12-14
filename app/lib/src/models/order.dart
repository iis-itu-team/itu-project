import 'package:food_blueprint/src/models/burger.dart';

class Order {
  String? id;
  String? street;
  String? houseNumber;
  String? zipCode;
  String? city;
  String? floor;
  int? phone;
  String? notes;
  int? price;
  bool? ring;
  bool? toHouse;
  bool? toDoors;
  bool? toFlatDoors;
  DateTime date = DateTime.now();

  List<Burger> burgers = [];

  Order();

  Order.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        price = json["price"],
        date = json["date"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'street': street,
        'houseNumber': houseNumber,
        'phone': phone,
        'notes': notes,
        'price': price,
        'toHouse': toHouse,
        'toDoors': toDoors,
        'toFlatDoors': toFlatDoors,
        'date': date,
        'burgers': burgers.map((e) => e.toJson()).toList()
      };
}
