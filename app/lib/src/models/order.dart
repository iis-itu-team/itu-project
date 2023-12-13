import 'package:food_blueprint/src/models/burger.dart';
import 'package:food_blueprint/src/models/user.dart';

class Order {
  final String id;
  final User user;
  String? street;
  String? housenumber;
  String? zipcode;
  String? city;
  int? phone;
  String? notes;
  int? price;
  bool? to_house;
  bool? to_doors;
  bool? to_flat_doors;

  DateTime date = DateTime.now();

  List<EditedBurger> editedburger = [];

  Order(this.id, this.user);

  Order.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        user = json["user"];

  Map<String, dynamic> toJson() =>
      {'id': id, 'editedburger': editedburger.map((e) => e.toJson()).toList()};
}
