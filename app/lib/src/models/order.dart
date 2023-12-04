import 'package:food_blueprint/src/models/food.dart';
import 'package:food_blueprint/src/models/user.dart';

class Order {
  final String id;
  final Type time;
  final User user;
  String? street;
  String? housenumber;
  String? zipcode;
  String? city;
  int? phone;
  String? notes;
  int? price;
  List<EditedFood> editedfood = [];

  Order(this.id, this.time, this.user);

  Order.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        time = json["time"],
        user = json["user"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': time,
        'editedfood': editedfood.map((e) => e.toJson()).toList()
      };
}
