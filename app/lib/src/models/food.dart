class Food {
  final String id;
  String name;

  Food(this.id, this.name);

  Food.fromJson(Map<String, dynamic> json) : id = json["id"] as String, name = json['name'] as String;

  Map<String, dynamic> toJson() => {'name': name};
}
