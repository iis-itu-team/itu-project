class Ingredient {
  final String id;
  final String name;
  final int price;

  Ingredient(this.id, this.name, this.price);

  Ingredient.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        price = json["price"],
        name = json["name"];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'price': price};
}
