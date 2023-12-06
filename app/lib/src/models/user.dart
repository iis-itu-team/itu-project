import 'package:food_blueprint/src/models/burger.dart';

class User {
  final String id;
  final String name;
  String? password;
  List<Editedburger> editedburger = [];

  User(this.id, this.name, this.password);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'editedburger': editedburger.map((e) => e.toJson()).toList()
      };
}
