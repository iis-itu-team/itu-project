import '../models/burger.dart';

class BurgerDeletedEvent {
  final Burger burger;

  BurgerDeletedEvent(this.burger);
}
