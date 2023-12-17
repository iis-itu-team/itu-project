/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'package:food_blueprint/src/models/burger.dart';

class BurgerUpdatedEvent {
  final Burger burger;

  BurgerUpdatedEvent(this.burger);
}
