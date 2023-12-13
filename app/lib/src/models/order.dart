import 'package:food_blueprint/src/models/user.dart';
import 'package:food_blueprint/src/models/burger.dart';

class Order {
  final String id;
  final User user;
  String? street;
  String? houseNumber;
  String? zipCode;
  String? city;
  int? phone;
  String? notes;
  int? price;
  bool? toHouse;
  bool? toDoors;
  bool? toFlatDoors;
  int? price;
  DateTime date = DateTime.now();

  List<Burger> burgers = [];

  Order(this.id, this.user);

  Order.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        user = json["user"],
        price = json["price"],
        date = json["date"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user,
        'street': street,
        'houseNumber': houseNumber,
        'phone': phone,
        'notes': notes,
        'price': price,
        'toHouse': toHouse,
        'toDoors': toDoors,
        'toFlatDoors': toFlatDoors,
        'date': date,
        'price': price,
        'burgers': burgers.map((e) => e.toJson()).toList()
      };
}
