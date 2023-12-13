import 'package:food_blueprint/src/models/burger.dart';

class User {
  final String id;
  final String name;
  String? password;
  List<Burger> burgers = [];

  User(this.id, this.name, this.password);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'burgers': burgers.map((e) => e.toJson()).toList()
      };
}
