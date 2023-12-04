import 'package:food_blueprint/src/models/food.dart';

class User {
  final String id;
  final String name;
  String? password;
  List<EditedFood> editedfood = [];

  User(this.id, this.name, this.password);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'editedfood': editedfood.map((e) => e.toJson()).toList()
      };
}
