/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import '../models/burger.dart';

class BurgerDeletedEvent {
  final Burger burger;

  BurgerDeletedEvent(this.burger);
}
