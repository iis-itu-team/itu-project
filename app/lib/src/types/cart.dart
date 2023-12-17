/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 17. 12. 2023
///
// A cart object that contains burgers we want to order and their amounts
import 'package:food_blueprint/src/models/burger.dart';

class CartBurger {
  final Burger burger;
  final int amount;

  CartBurger({required this.burger, this.amount = 1});
}

class Cart {
  final List<CartBurger> items = [];

  Cart();

  int getTotalPrice() {
    return items.map((b) => b.burger.price ?? 0).reduce((a, b) => a + b);
  }

  void addItem(Burger burger, {int amount = 1}) {
    items.add(CartBurger(burger: burger, amount: amount));
  }

  void removeItem(String burgerId) {
    items.removeWhere((element) => element.burger.id == burgerId);
  }
}
