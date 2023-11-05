class Ingredient {
  final String id;
  final int price;

  int amount = 1;

  Ingredient(this.id, this.price);

  Ingredient.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        price = json["price"];

  Map<String, dynamic> toJson() => {'id': id, 'amount': amount};
}
