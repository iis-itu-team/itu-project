///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 17. 12. 2023
///
import 'package:food_blueprint/src/types/cart.dart';

class CartItemDroppedEvent {
  final CartBurger item;

  CartItemDroppedEvent(this.item);
}
